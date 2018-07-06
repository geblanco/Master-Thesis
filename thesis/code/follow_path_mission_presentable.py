#!/usr/bin/env python2

import executive_engine_api as api
import sys
import json
import os.path as path
import time
import rospy

from std_msgs.msg import String
from std_srvs.srv import Empty

# reset sequence is:
# 1. LAND
# 2. Reset world: /gazebo/reset_world ""
# 3. Reset planner: /drone11/move_base/syscommand "reset"
# 4. SLAM
def reset():
  # rospy.init_node('reset')
  print('Reset sequence started...')
  uid = api.executeBehavior('LAND')
  print('-> Landed')
  gazebo_pub = rospy.ServiceProxy('/gazebo/reset_world', Empty)
  gazebo_pub.call()
  print('-> Gazebo worl reset')
  planner_pub = rospy.Publisher('/drone11/move_base/syscommand', String, queue_size=1)
  planner_pub.publish(String('reset'))
  print('-> Planner reset')
  activated, uid = api.activateBehavior('SELF_LOCALIZE_AND_MAP_BY_LIDAR')
  print('-> SLAM')
  rospy.sleep(0.5)
  print('... done')

behavior_uids = {}
behavior_names = {
  'take_off': 'TAKE_OFF',
  'follow'  : 'FOLLOW_PATH_IN_OCCUPANCY_GRID',
  'slam'    : 'SELF_LOCALIZE_AND_MAP_BY_LIDAR',
}
 
def dump(test_no, dir_path, prefix, store):
  file_path = path.abspath('{}/{}_{}'.format(dir_path, prefix, test_no))
  print('dumping {} to {}_{}'.format(prefix, prefix, test_no))
  f = open(file_path, 'w+')
  f.writelines(list(map(lambda x: str(x), store)))
  f.close()

def load_paths(tests, dir_path):
  paths = []
  for i in range(tests):
    f_name = 'paths_{}'.format(i)
    print('read {}'.format(f_name))
    f = open('{}/{}'.format(dir_path, f_name))
    paths.append(f.readlines())
    f.close()
  return paths

def run_mission(paths=[]):
  print('Starting mission...')
  activated, uid = api.activateBehavior(behavior_names['slam'])
  if not activated:
    raise Exception('Unable to continue without SLAM')
  rospy.sleep(0.2)
  result = api.executeBehavior(behavior_names['take_off'])
  times = []
  fails = 0
  for path in paths:
    print('-> follow path with lenght {}'.format(str(len(path))))
    start = time.time()
    result = api.executeBehavior(behavior_names['follow'], path=path)
    end = time.time()
    elapsed = end - start
    times.append(elapsed)
    print('-> result {}'.format(result))
    if result != 'GOAL_ACHIEVED':
      fails += 1

  print('Finish mission...')
  return full_test_elapsed, times, fails

def runMission():
  dir_with_paths = '/root/workspace/ros/aerostack_catkin_ws/src/aerostack_stack/launchers/tfm_guillermo/test_results/follow_path/paths_to_follow'
  tests = 10
  data = { "paths": load_paths(tests, dir_with_paths) }
  mission_times = []
  dir_path = '/root/workspace/ros/aerostack_catkin_ws/src/aerostack_stack/launchers/tfm_guillermo/test_results/follow_path'
  print('Start dump dir: {}'.format(dir_path))
  for test_no in range(tests):
    print('######## TEST {} ########'.format(test_no))
    # start measuring time
    start = time.time()
    path_times, fails = run_mission(paths=data[test_no])
    # end measuring time
    end = time.time()
    elapsed = end - start
    print('Completed mission in {} secods with {} fails'.format(elapsed, fails))
    mission_times.append(elapsed)
    dump(test_no=test_no, dir_path=dir_path, prefix='point_fails', store=[fails])
    dump(test_no=test_no, dir_path=dir_path, prefix='path_times', store=path_times)
    reset()
    print('########  DONE  ########'.format(test_no))
  dump(test_no=0, dir_path=dir_path, prefix='global_times', store=mission_times)

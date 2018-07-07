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
  'generate': 'GENERATE_PATH_IN_OCCUPANCY_GRID'
}
 
def get_path():
  query = 'path(0,?y)'
  success, unification = api.consultBelief(query)
  path = 'no_path' if not success else unification['y']
  if path == 'no_path':
    print('gen failed, ask again')
    return None
  api.assertBelief('path(0, no_path)', multivalued=False)
  return path


def dump(test_no, dir_path, prefix, store):
  file_path = path.abspath('{}/{}_{}'.format(dir_path, prefix, test_no))
  print('dumping {} to {}_{}'.format(prefix, prefix, test_no))
  f = open(file_path, 'w+')
  f.writelines(list(map(lambda x: str(x) + '\n', store)))
  f.close()

def run_mission(paths=[]):
  print('Starting mission...')
  activated, uid = api.activateBehavior(behavior_names['slam'])
  if not activated:
    raise Exception('Unable to continue without SLAM')
  rospy.sleep(0.2)
  result = api.executeBehavior(behavior_names['take_off'])
  rospy.sleep(1)
  max_tries = 5
  times = []
  full_test_elapsed = 0
  fails = 0
  for path in paths:
    str_path = None
    tries = 0
    print('-> follow path to point {}'.format(str(path)))
    while str_path is None and tries < max_tries:
      print('-> get a valid path tries {}'.format(str(tries)))
      result = api.executeBehavior(behavior_names['generate'], coordinates=path)
      str_path = get_path()
      print('-> got path back')
      tries += 1
    start = time.time()
    result = api.executeBehavior(behavior_names['follow'], path=str_path)
    end = time.time()
    elapsed = end - start
    times.append(elapsed)
    full_test_elapsed += elapsed
    print('-> result {}'.format(result))
    if result != 'GOAL_ACHIEVED':
      fails += 1

  print('Finish mission...')
  return full_test_elapsed, times, fails

def runMission():
  data = {
    "paths": [
      [0, 0, 1.5],
      [1, 0, 1.5],
      [1, 0, 10],
      [1, -5, 10], 
      [0, -5, 10], 
      [0, -5, 1.5]
    ]
  }
  tests = 5
  mission_times = []
  dir_path = '/root/workspace/ros/aerostack_catkin_ws/src/aerostack_stack/launchers/tfm_guillermo/test_results/follow_path'
  print('Start dump dir: {}'.format(dir_path))
  for test_no in range(tests):
    print('######## TEST {} ########'.format(test_no))
    # start measuring time
    elapsed, path_times, fails = run_mission(**data)
    # end measuring time
    print('Completed mission in {} secods with {} fails'.format(elapsed, fails))
    mission_times.append(elapsed)
    dump(test_no=test_no, dir_path=dir_path, prefix='point_fails', store=[fails])
    dump(test_no=test_no, dir_path=dir_path, prefix='path_times', store=path_times)
    reset()
    print('########  DONE  ########'.format(test_no))
  dump(test_no=0, dir_path=dir_path, prefix='global_times', store=mission_times)

#!/usr/bin/env python2

import executive_engine_api as api
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
  'generate' : 'GENERATE_PATH_IN_OCCUPANCY_GRID',
  'slam'     : 'SELF_LOCALIZE_AND_MAP_BY_LIDAR',
}
 
def get_paths(round_n, n_tests, path_store):
  for test_no in range(1, n_tests + 1):
    path_no = round_n * 10 + test_no
    print('ask for path', path_no)
    query = 'path({},?y)'.format(path_no)
    success, unification = api.consultBelief(query)
    path = '(FAIL)' if not success else unification['y']
    path_store.append(path + '\n')

def dump(test_no, dir_path, prefix, store):
  file_path = path.abspath('{}/{}_{}'.format(dir_path, prefix, test_no))
  print('dumping {} to {}_{}'.format(prefix, prefix, test_no))
  f = open(file_path, 'w+')
  f.writelines(list(map(lambda x: str(x) + '\n', store)))
  f.close()

def run_mission(points=[]):
  print('Starting mission...')
  activated, uid = activated, uid = api.activateBehavior(behavior_names['slam'])
  if not activated:
    raise Exception('Unable to continue without SLAM')
  rospy.sleep(0.2)
  times = []
  fails = 0
  for point in points:
    print('-> generate path to point {}'.format(str(point)))
    start = time.time()
    result = api.executeBehavior(behavior_names['generate'], coordinates=point)
    end = time.time()
    elapsed = end - start
    times.append(elapsed)
    print('-> result {}'.format(result))
    if result != 'GOAL_ACHIEVED':
      fails += 1

  print('Finish mission...')
  return times, fails

def runMission():
  data = {
    "points": [
      [0, 0, 1.5],
      [1, 0, 1.5],
      [1, 0, 10],
      [1, -5, 10], 
      [0, -5, 10], 
      [0, -5, 1.5]
    ]
  }
  tests = 10
  mission_times = []
  dir_path = '/root/workspace/ros/aerostack_catkin_ws/src/aerostack_stack/launchers/tfm_guillermo/test_results/generate_path'
  print('Start dump dir: {}'.format(dir_path))
  for test_no in range(tests):
    print('######## TEST {} ########'.format(test_no))
    # start measuring time
    start = time.time()
    point_times, fails = run_mission(**data)
    # end measuring time
    end = time.time()
    elapsed = end - start
    print('Completed mission in {} secods with {} fails'.format(elapsed, fails))
    mission_times.append(elapsed)
    path_store = []
    # get_paths(test_no, tests, path_store)
    # dump(test_no=test_no, dir_path=dir_path, prefix='paths', store=path_store)
    dump(test_no=test_no, dir_path=dir_path, prefix='point_fails', store=[fails])
    dump(test_no=test_no, dir_path=dir_path, prefix='point_times', store=point_times)
    print('########  DONE  ########'.format(test_no))
  dump(test_no=0, dir_path=dir_path, prefix='global_times', store=mission_times)


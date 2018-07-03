#!/usr/bin/env python2

import executive_engine_api as api
import sys
import json
import os.path as path

behavior_uids = {}
behavior_names = {
  'go_to_point' : 'GO_TO_POINT_IN_OCCUPANCY_GRID',
  'slam'        : 'SELF_LOCALIZE_AND_MAP_BY_ODOMETRY',
  'take_off'    : 'TAKE_OFF',
  'land'        : 'LAND'
}
 
# ToDo := Test activateBehavior or executeBehavior in:
#   take off
def activate(behavior):
  behavior_name = behavior_names[behavior]
  print('-> ' + behavior)
  activated, uid = api.activateBehavior(behavior)
  if not activated:
    uid = -1
  return uid

def go_to_point(coordinates='absolute', point=[]):
  if len(point) == 0:
    raise Exception('Empty point!')

  print('-> go to point ' + point + ' mode ' + coordinates)
  if coordinates == 'absolute':
    activated, uid = api.activateBehavior(GO_TO_BEHAV_NAME, relative_coordinates=point)
  else:
    activated, uid = api.activateBehavior(GO_TO_BEHAV_NAME, coordinates=point)
  if not activated:
    uid = -1
  return uid

def run_mission(coordinates='absolute', points=[]):
  print('Starting mission...')
  behaviors = ['slam', 'take_off']
  for behavior in behaviors:
    uid = activate(behavior)
    assert(uid != -1)
    behavior_uids[behavior] = uid
    print('-> done id: ' + uid)

  for point in points:
    uid = go_to_point(coordinates=coordinates, point=point)
    if uid == -1:
      # no success, land
      break

  uid = activate('land')
  assert(uid != -1)
  print('Finish mission...')

def usage():
  print('Usage mission.py points.json')

if __name__ == '__main__':
  try:
    assert(len(sys.argv) > 1)
    assert(path.isfile(sys.argv[1]))
  except:
    usage()
    sys.exit(1)
  try:
    data = json.loads(sys.argv[1])
    assert(data.get('coordinates', None) is not None)
    assert(data.get('point', None) is not None)
    assert(len(data['points']) > 0)
    run_mission(data)
  except:
    print('Malformed json!')
    usage()
    sys.exit(2)

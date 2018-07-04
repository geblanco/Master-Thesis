#!/usr/bin/env python2

import executive_engine_api as api
import sys
import json
import os.path as path

behavior_uids = {}
behavior_names = {
  'go_to_point' : 'GO_TO_POINT_IN_OCCUPANCY_GRID',
  'slam'        : 'SELF_LOCALIZE_AND_MAP_BY_LIDAR',
  'take_off'    : 'TAKE_OFF',
  'land'        : 'LAND'
}
 
# ToDo := Test activateBehavior or executeBehavior in:
#   take off
def activate(behavior):
  behavior_name = behavior_names[behavior]
  print('-> activate ' + behavior + '(' + behavior_names[behavior] + ')')
  uid = api.executeBehavior(behavior)
  return uid

def go_to_point(coordinates='absolute', point=[]):
  if len(point) == 0:
    raise Exception('Empty point!')

  print('-> go to point ' + str(point) + ' mode ' + coordinates)
  if coordinates == 'absolute':
    activated, uid = api.activateBehavior(behavior_names['go_to_point'], coordinates=point)
  else:
    activated, uid = api.activateBehavior(behavior_names['go_to_point'], relative_coordinates=point)
  return uid

def get_input():
  char = ''
  while char != 'q' and char != 'c':
    char = raw_input('Continue, quit (c/q)')

  return char

def run_mission(coordinates='absolute', points=[]):
  print('run_mission', coordinates, points)
  print('Starting mission...')
  print('-> activate SLAM')
  print(api.activateBehavior(behavior_names['slam']))
  print('-> execute TAKE_OFF')
  print(api.executeBehavior(behavior_names['take_off']))

  char = get_input()
  index = 0
  while char != 'q' and index < len(points):
    point = points[index]
    go_to_point(coordinates=coordinates, point=point)
    index += 1
    char = get_input()

  print(api.executeBehavior(behavior_names['land']))
  print('Finish mission...')

def usage():
  print('Usage mission.py points.json')

def runMission():
  data = {
    "coordinates": "absolute",
    "points": [
      [0, 0, 1.5],
      [1, 0, 1.5],
      [1, 0, 10],
      [1, -5, 10], 
      [0, -5, 10], 
      [0, -5, 1.5]
    ]
  }
  run_mission(**data)

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

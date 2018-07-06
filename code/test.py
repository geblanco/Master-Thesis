#!/usr/bin/python

import rospy

from droneMsgsROS.srv import GeneratePath
from droneMsgsROS.msg import PathWithID
from droneMsgsROS.msg import dronePositionTrajectoryRefCommand
from droneMsgsROS.msg import dronePositionRefCommand
from geometry_msgs.msg import PoseStamped

def get_pose():
  pose = PoseStamped()
  pose.pose.position.x = 1
  pose.pose.position.y = 0
  pose.pose.position.z = 1.5
  return pose

def ask():
  path_id = srv(goal=get_pose())
  print('Requested path, got id: {}'.format(path_id))

def main():
  
  global srv
  global point
  global pub
  global callback
  global requests
  global requested

  requests = 2
  requested = 0
  pub = rospy.Publisher('/drone11/follow_path', dronePositionTrajectoryRefCommand, queue_size=1)

  def callback(data):
    global requested

    print("Got a path back header {}, size {}".format(data.header, len(data.poses)))
    msg = dronePositionTrajectoryRefCommand()
    msg.header.stamp = rospy.Time.now()
    msg.initial_checkpoint = 0
    msg.is_periodic = False
    for pose in data.poses:
      next_waypoint = dronePositionRefCommand()
      next_waypoint.x = pose.pose.position.x
      next_waypoint.y = pose.pose.position.y
      next_waypoint.z = pose.pose.position.z
      msg.droneTrajectory.append(next_waypoint)
  
    requested = requested + 1
    if requested >= requests:
      return

    print("Publishing {}, size {}".format(msg.header, len(msg.droneTrajectory)))
    pub.publish(msg)
    ask()

  sub = rospy.Subscriber('/drone11/path_with_id', PathWithID, callback)
  rospy.init_node('path_tester')
  
  srv = rospy.ServiceProxy('/drone11/generate_path', GeneratePath)
  rate = rospy.Rate(5)
  ask()

  while not rospy.is_shutdown():
    rate.sleep()

if __name__ == '__main__':
  main()
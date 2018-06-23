# Navigation Behaviors - Tasks

1. Identify necessary behaviors.
    1. For each behavior extract the topics it will accept and the algorithms it will cover.
    2. For each behavior estimate time to implement, along with it's launcher, time to integrate and validate it.
    3. For each behavior plan some scenarios to test the behavior
    4. For each behavior implement, integrate, create the scenario and validate the behavior.

## 1. Identified Behaviors

### Self Localize By Lidar

This behavior accepts the lidar scanned data and outputs an occupancy grid based map and an estimation of its position inside it based on IMU, odometry and slam. It encapsulates the lidar slam nodes, monitoring both the robot localization and the hector mapping nodes.

The nodes that do not accept it's output topics to be named should be masked.

#### Monitors:

* \* `hector_mapping`
* `ekf_localization`
* `droneRobotLocalizationROSModuleNode` (should probably be renamed)

\* Should be masked

#### Inputs:

* `/droneX/scan` lidar scan data for hector mapping.

Inherited from `hector_mapping`:

* `/droneX/initialpose [geometry_msgs/PoseWithCovarianceStamped]`
* `/droneX/scan [sensor_msgs/LaserScan]`
* `/droneX/syscommand [unknown type]`
* `/tf [tf2_msgs/TFMessage]`

Inherited from `ekf_localization`:

* `/droneX/altitude/data [nav_msgs/Odometry]`
* `/droneX/hector_slam/data [nav_msgs/Odometry]`
* `/droneX/imu/data [sensor_msgs/Imu]`
* `/droneX/laser_scan_pose/data [nav_msgs/Odometry]`
* `/droneX/optical_flow/data [nav_msgs/Odometry]`
* `/droneX/set_pose [geometry_msgs/PoseWithCovarianceStamped]`
* `/tf [tf2_msgs/TFMessage]`

Inherited from `droneRobotLocalizationROSModuleNode`:

* `/droneX/altitude [droneMsgsROS/droneAltitude]`
* `/droneX/command/dAltitude [droneMsgsROS/droneDAltitudeCmd]`
* `/droneX/command/dYaw [droneMsgsROS/droneDYawCmd]`
* `/droneX/command/pitch_roll [droneMsgsROS/dronePitchRollCmd]`
* `/droneX/ground_speed [droneMsgsROS/vector2Stamped]`
* `/droneX/imu [sensor_msgs/Imu]`
* `/droneX/lb_estimated_pose/door_pose [unknown type]`
* `/droneX/lb_estimated_pose/window_pose [unknown type]`
* `/droneX/mavros/global_position/raw/fix [unknown type]`
* `/droneX/odometry/filtered [nav_msgs/Odometry]`
* `/droneX/poseupdate [geometry_msgs/PoseWithCovarianceStamped]`
* `/droneX/rotation_angles [geometry_msgs/Vector3Stamped]`
* `/droneX/states/ardrone3/PilotingState/AltitudeChanged [unknown type]`
* `/droneX/states/ardrone3/PilotingState/AttitudeChanged [unknown type]`
* `/droneX/states/ardrone3/PilotingState/SpeedChanged [unknown type]`
* `/droneX/vb_estimated_pose/rpnp_pose [unknown type]`
* `/final_pose [unknown type]`
* `/gazebo/model_states [gazebo_msgs/ModelStates]`
* `/tf [tf2_msgs/TFMessage]`

#### Outputs

* `/droneX/map` the map as processed from the hector mapping node. **hector mapping _map_ topic should be masked**
* `/droneX/pose` the extimated pose of the robot in the map. Grabbed from `droneRobotLocalizationROSModuleNode/EstimatedPose_droneGMR_wrt_GFF` topic
* `/droneX/speed` the extimated speed of the robot in the map. Grabbed from `droneRobotLocalizationROSModuleNode/EstimatedSpeed_droneGMR_wrt_GFF` topic

Inherited from `hector_mapping`:

* `/droneX/hector_debug_info [hector_mapping/HectorDebugInfo]`
* `/droneX/map [nav_msgs/OccupancyGrid]`
* `/droneX/map_metadata [nav_msgs/MapMetaData]`
* `/droneX/poseupdate [geometry_msgs/PoseWithCovarianceStamped]`
* `/droneX/slam_cloud [sensor_msgs/PointCloud]`
* `/droneX/slam_out_pose [geometry_msgs/PoseStamped]`
* `/tf [tf2_msgs/TFMessage]`

Inherited from `ekf_localization`:

* `/diagnostics [diagnostic_msgs/DiagnosticArray]`
* `/droneX/odometry/filtered [nav_msgs/Odometry]`
* `/tf [tf2_msgs/TFMessage]`

Inherited from `droneRobotLocalizationROSModuleNode`:

* `/droneX/EstimatedPose_droneGMR_wrt_GFF [droneMsgsROS/dronePose]`
* `/droneX/EstimatedSpeed_droneGMR_wrt_GFF [droneMsgsROS/droneSpeeds]`
* `/droneX/PnP_pose/data [nav_msgs/Odometry]`
* `/droneX/VO_Semantic_SLAM/Pose/data [nav_msgs/Odometry]`
* `/droneX/altitude/data [nav_msgs/Odometry]`
* `/droneX/altitude_gt/data [nav_msgs/Odometry]`
* `/droneX/bebop_imu/data [sensor_msgs/Imu]`
* `/droneX/bebop_vel_alti/data [nav_msgs/Odometry]`
* `/droneX/controller/odom/data [nav_msgs/Odometry]`
* `/droneX/gps/fix_data [sensor_msgs/NavSatFix]`
* `/droneX/hector_slam/data [nav_msgs/Odometry]`
* `/droneX/imu/data [sensor_msgs/Imu]`
* `/droneX/laser_scan_pose/data [nav_msgs/Odometry]`
* `/droneX/laser_scan_window_pose/data [nav_msgs/Odometry]`
* `/droneX/optical_flow/data [nav_msgs/Odometry]`
* `/droneX/process_alive_signal [droneMsgsROS/AliveSignal]`
* `/droneX/rotation_angles/data [sensor_msgs/Imu]`
* `/droneX/set_pose [geometry_msgs/PoseWithCovarianceStamped]`
* `/droneX/slamdunk_pose/data [nav_msgs/Odometry]`
* `/tf [tf2_msgs/TFMessage]`

#### Time estimates

| Implement | Integrate | Validate |
| --------- | :-------- | :------- |
| 10-20h    | 8-16h     | 4-8h     |


### Generate Global Path to Goal (or generate path in occupancy grid)

This behavior accepts a goal and an occupancy grid map and outputs an obstacle-free path to that goal. It encapsulates both move base and nav interface nodes.

The nodes that do not accept it's output topics to be named should be masked.

**There is a known problem with the move base module, when not enough processing power is available, it hangs. The Navigation Interface handles this correctly, the code for that should be included in the behavior.**

#### Monitors:

* \* `move_base`

\* Should be masked

#### Inputs:

* `/droneX/map` for the move base module. **move base _map_ topic should be masked/renamed**
* `/droneX/scan` for the move base module. **move base _scan_ topic should be masked/renamed**
* `/droneX/goal` to plan the path.


Inherited from `move_base`:

* `/droneX/map [nav_msgs/OccupancyGrid]`
* `/droneX/move_base/cancel [unknown type]`
* `/droneX/move_base/global_costmap/footprint [geometry_msgs/PolygonStamped]`
* `/droneX/move_base/goal [move_base_msgs/MoveBaseActionGoal]`
* `/droneX/move_base/local_costmap/footprint [geometry_msgs/PolygonStamped]`
* `/droneX/move_base_simple/goal [geometry_msgs/PoseStamped]`
* `/droneX/odom [nav_msgs/Odometry]`
* `/droneX/scan [sensor_msgs/LaserScan]`
* `/tf [tf2_msgs/TFMessage]`

#### Outputs

* `/droneX/path` path to the desired goal, grabbed from `/droneX/move_base/NavfnROS/plan`.

Inherited from `move_base`:

* `/droneX/cmd_vel [geometry_msgs/Twist]`
* `/droneX/move_base/EBandPlannerROS/eband_visualization [visualization_msgs/Marker]`
* `/droneX/move_base/EBandPlannerROS/eband_visualization_array [visualization_msgs/MarkerArray]`
* `/droneX/move_base/EBandPlannerROS/global_plan [nav_msgs/Path]`
* `/droneX/move_base/EBandPlannerROS/local_plan [nav_msgs/Path]`
* `/droneX/move_base/EBandPlannerROS/parameter_descriptions [dynamic_reconfigure/ConfigDescription]`
* `/droneX/move_base/EBandPlannerROS/parameter_updates [dynamic_reconfigure/Config]`
* `/droneX/move_base/NavfnROS/plan [nav_msgs/Path]`
* `/droneX/move_base/current_goal [geometry_msgs/PoseStamped]`
* `/droneX/move_base/feedback [move_base_msgs/MoveBaseActionFeedback]`
* `/droneX/move_base/global_costmap/costmap [nav_msgs/OccupancyGrid]`
* `/droneX/move_base/global_costmap/costmap_updates [map_msgs/OccupancyGridUpdate]`
* `/droneX/move_base/global_costmap/footprint [geometry_msgs/PolygonStamped]`
* `/droneX/move_base/global_costmap/inflation_layer/parameter_descriptions [dynamic_reconfigure/ConfigDescription]`
* `/droneX/move_base/global_costmap/inflation_layer/parameter_updates [dynamic_reconfigure/Config]`
* `/droneX/move_base/global_costmap/obstacle_layer/parameter_descriptions [dynamic_reconfigure/ConfigDescription]`
* `/droneX/move_base/global_costmap/obstacle_layer/parameter_updates [dynamic_reconfigure/Config]`
* `/droneX/move_base/global_costmap/parameter_descriptions [dynamic_reconfigure/ConfigDescription]`
* `/droneX/move_base/global_costmap/parameter_updates [dynamic_reconfigure/Config]`
* `/droneX/move_base/global_costmap/static_layer/parameter_descriptions [dynamic_reconfigure/ConfigDescription]`
* `/droneX/move_base/global_costmap/static_layer/parameter_updates [dynamic_reconfigure/Config]`
* `/droneX/move_base/goal [move_base_msgs/MoveBaseActionGoal]`
* `/droneX/move_base/local_costmap/costmap [nav_msgs/OccupancyGrid]`
* `/droneX/move_base/local_costmap/costmap_updates [map_msgs/OccupancyGridUpdate]`
* `/droneX/move_base/local_costmap/footprint [geometry_msgs/PolygonStamped]`
* `/droneX/move_base/local_costmap/inflation_layer/parameter_descriptions [dynamic_reconfigure/ConfigDescription]`
* `/droneX/move_base/local_costmap/inflation_layer/parameter_updates [dynamic_reconfigure/Config]`
* `/droneX/move_base/local_costmap/obstacle_layer/parameter_descriptions [dynamic_reconfigure/ConfigDescription]`
* `/droneX/move_base/local_costmap/obstacle_layer/parameter_updates [dynamic_reconfigure/Config]`
* `/droneX/move_base/local_costmap/parameter_descriptions [dynamic_reconfigure/ConfigDescription]`
* `/droneX/move_base/local_costmap/parameter_updates [dynamic_reconfigure/Config]`
* `/droneX/move_base/local_costmap/static_layer/parameter_descriptions [dynamic_reconfigure/ConfigDescription]`
* `/droneX/move_base/local_costmap/static_layer/parameter_updates [dynamic_reconfigure/Config]`
* `/droneX/move_base/parameter_descriptions [dynamic_reconfigure/ConfigDescription]`
* `/droneX/move_base/parameter_updates [dynamic_reconfigure/Config]`
* `/droneX/move_base/result [move_base_msgs/MoveBaseActionResult]`
* `/droneX/move_base/status [actionlib_msgs/GoalStatusArray]`

#### Time estimates

| Implement | Integrate | Validate |
| --------- | :-------- | :------- |
| 8-16h     | 4-6h      | 4-8h     |

## Extra Notes

By now, the goals are generated by the Global Mission Planner, this should probably bypassed and the output of th Go To Point Behavior should be accepted. This bridges the current developed behaviors with the new behavior-based Navigation stack.

**Doubt** Should the topics be masked under the behavior in development? Ie: `/droneX/move_base/status` -> `/droneX/behavior_generate_path_to_goal/move_base/status`

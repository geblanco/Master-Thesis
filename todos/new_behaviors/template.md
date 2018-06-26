# Template for new ROS Nodes

This document describes a new ROS Node. Summarizing its input output topics and the services it provides.

Also, to help visualizing the module, it could be helpful to do a flow diagram, like the one in the link below:

[Flow Diagram](https://drive.google.com/file/d/1T9iCar-fz9MFrTtq3e0th_4QFSZG-X_k/view?usp=sharing)

In the case of programming a new behavior, please follow this [guideline](https://bitbucket.org/Vision4UAV/aerostack/wiki/Program%20new%20behaviors) (it summarizes how to include a new ros module and a few details about behaviors).

# Brief

> Describe briefly the implemented node, what it does (not how it does it).

# Subscribed Topics

- **Name of the topic** (The ROS message with a link to the specification reference) 
A short description 

# Published Topics

- **Name of the topic** (The ROS message with a link to the specification reference) 
A short description 

> To maintain the same nomenclature across all the aerostack, it is important that the topic messages are called with camelCaseStyle. Also, use std\_msgs, common\_msgs or aerostack\_msgs and avoiding droneMsgsROS, which is deprecated when available.

# Services

- **Name of the topic** (The ROS message with a link to the specification reference) 
A short description 

> To maintain the same nomenclature across all the aerostack, it is important that the services are called with underscores\_in\_the\_name. Also, use std\_msgs, common\_msgs or aerostack\_msgs and avoiding droneMsgsROS, which is deprecated when available.

# Inherits

> If the main class Inherits from any process (ie DroneProcess, RobotProcess...)

# Contributors

Maintainer: The name of the person maintaining the module (email)

Author: Your name (email)

# Notes

> Spcial considerations (ie: requires... or frame rate is...)

---

# Example

> Erase this example for the submission please!

# Brief 
SLAM Node. This node does SLAM based on lidar scan ray traces. It accepts the scan from lidar and outputs an estimated map along with a posed.

# Subscribed Topics

- **scan** ([sensor\_msgs/LaserScan](http://docs.ros.org/api/sensor_msgs/html/msg/LaserScan.html)). The scan as received from the lidar 

# Published Topics

- **poseupdate** ([geometry\_msgs/PoseWithCovarianceStamped](http://docs.ros.org/api/geometry_msgs/html/msg/PoseWithCovarianceStamped.html)). The estimated pose updated at 30Hz.
- **map** ([nav\_msgs/OccupancyGrid](http://docs.ros.org/api/nav_msgs/html/msg/OccupancyGrid.html)). The processed map from the lidar scan, after the SLAM procedure is applied.

# Services

- **reset** ([std\_srvs/Empty](http://docs.ros.org/api/std_srvs/html/srv/Empty.html)). Reset the whole SLAM procedure and start again.

# Contributors

Maintainer: Guillermo Echegoyen Blanco (guillermosemail@gmail.com)

Author: Guillermo Echegoyen Blanco (guillermosemail@gmail.com)

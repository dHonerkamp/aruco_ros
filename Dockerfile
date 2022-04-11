FROM ros:melodic

RUN apt-get update \
    && apt-get install -y python-catkin-tools ros-melodic-tf2-ros ros-melodic-cv-bridge python3-pip libeigen3-dev vim ros-melodic-image-transport ros-melodic-tf \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p catkin_ws/src/
WORKDIR catkin_ws

RUN git clone --branch melodic-devel https://github.com/dHonerkamp/aruco_ros.git src/aruco_ros
RUN /bin/bash -c ". /opt/ros/melodic/setup.bash && catkin build || exit"

CMD /bin/bash -c ". devel/setup.bash && roslaunch aruco_ros pr2.launch"

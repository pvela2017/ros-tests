# Pull the image
FROM osrf/ros:rolling-desktop-full

# Change to bash
SHELL ["/bin/bash", "-c"]

# Install ubuntu packages
RUN apt-get update 
RUN apt install -y wget \
                   curl \
                   gnupg \
                   vim \
                   python3-pip

# Install ROS2 packages
RUN apt-get update && \
    apt install -y ros-rolling-message-filters \
                   ros-rolling-diagnostic-updater \
                   ros-rolling-geographic-msgs \
   	 			   ros-rolling-rqt-tf-tree \
                   ros-rolling-plotjuggler-ros \
                   ros-rolling-tf-transformations

# Install dependencies for packages
RUN apt-get update && \
    apt install -y libgeographiclib-dev

# Copy the ROS project into the container
RUN mkdir -p /root/ros2_ws

# Set workdir in ros
WORKDIR /root/ros2_ws

# Set ROS in .bashrc
RUN echo source /opt/ros/rolling/setup.bash >> /root/.bashrc
RUN echo source /root/ros2_ws/install/setup.bash >> /root/.bashrc

# Clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get clean && apt autoclean
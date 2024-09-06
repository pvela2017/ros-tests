# ROS Test Suite

## Usage
1. Clone the repo:
   ```sh
   cd ~ && \
   git clone https://github.com/pvela2017/ros-tests.git
   ```
2. Change the Dockerfile and compose file to the needed images
3. Compile the image:
   ```sh
   cd ~/ros-tests && \
   docker build -t mefistocl/ros<version>:<distro> .
   ```
4. Clone the package to  be tested:
   ```sh
   mkdir -p ~/ros-tests/test/src && \
   cd ~/ros-tests/test/src && \
   git clone --recursive <repository>
   ```
5. Start the container:
   ```sh
   docker-compose run test /bin/bash
   ```
   
# Copyright 2025 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{
  lib,
  buildRosPackage,
  fetchurl,
  ament-cmake,
  ament-cmake-python,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  ament-package,
  builtin-interfaces,
  cli11,
  geometry-msgs,
  gflags,
  gz-math,
  gz-msgs,
  gz-sim,
  gz-transport,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  pkg-config,
  rclcpp,
  rclcpp-components,
  rcpputils,
  ros-gz-interfaces,
  std-msgs,
  tf2,
  tf2-ros,
  python-with-ament-package,
}:
buildRosPackage {
  pname = "ros-humble-ros-gz-sim";
  version = "0.244.20-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/ros_ign-release/archive/release/humble/ros_gz_sim/0.244.20-1.tar.gz";
    name = "0.244.20-1.tar.gz";
    hash = "sha256-Bck+Dzpi1N4XWSbbUnB/AXnSfPfp3Rq1gpRp1WYDPLw=";
  };

  # ign is binary wrapped. dont ruby it.
  # also use ogre
  postPatch = ''
    substituteInPlace launch/gz_sim.launch.py.in --replace-fail \
      "exec = 'ruby ' + get_executable_path('ign') + ' gazebo'" \
      "exec = get_executable_path('ign') + ' gazebo --render-engine ogre'"
  '';

  buildType = "ament_cmake";
  buildInputs = [
    ament-cmake
    ament-cmake-python
    ament-package
    pkg-config
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
    launch-ros
    launch-testing
    launch-testing-ament-cmake
  ];
  propagatedBuildInputs = [
    ament-index-python
    builtin-interfaces
    cli11
    geometry-msgs
    gflags
    gz-math
    gz-msgs
    gz-sim
    gz-transport
    launch
    launch-ros
    rclcpp
    rclcpp-components
    rcpputils
    ros-gz-interfaces
    std-msgs
    tf2
    tf2-ros
  ];
  nativeBuildInputs = [
    ament-cmake
    ament-cmake-python
    pkg-config
  ];

  env = {
    GZ_VERSION = "fortress";
    PYTHONPATH = python-with-ament-package;
  };

  meta = {
    description = "Tools for using Gazebo Sim simulation with ROS.";
    license = with lib.licenses; [ asl20 ];
  };
}

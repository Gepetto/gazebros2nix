{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  agimus-franka-hardware,
  agimus-franka-msgs,
  agimus-franka-semantic-components,
  agimus-libfranka,
  backward-ros,
  builtin-interfaces,
  control-msgs,
  controller-interface,
  controller-manager,
  generate-parameter-library,
  pluginlib,
  rclcpp-lifecycle,
  rcutils,
  realtime-tools,
  sensor-msgs,
  urdf,
  visualization-msgs,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  hardware-interface,
  rclcpp,
  ros2-control-test-assets,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-robot-state-broadcaster";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_franka_ros2";
    rev = "9dcef3a781458c65209b5b92f9be7ce1f1f72bfb";
    hash = "sha256-TsYvxsfGato6K3aJtnNzKhhzAmr+2vf3WDasI06V9iA=";
  };
  sourceRoot = "source/franka_robot_state_broadcaster";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    agimus-franka-hardware
    agimus-franka-msgs
    agimus-franka-semantic-components
    agimus-libfranka
    backward-ros
    builtin-interfaces
    control-msgs
    controller-interface
    controller-manager
    generate-parameter-library
    pluginlib
    rclcpp-lifecycle
    rcutils
    realtime-tools
    sensor-msgs
    urdf
    visualization-msgs
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-cmake-gmock
    hardware-interface
    rclcpp
    ros2-control-test-assets
  ];

  doCheck = false;

  meta = {
    description = "fork of franka_robot_state_broadcaster for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_franka_ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

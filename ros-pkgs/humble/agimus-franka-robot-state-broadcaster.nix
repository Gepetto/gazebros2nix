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
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  hardware-interface,
  rclcpp,
  ros2-control-test-assets,
  xmllintPackageHook,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-robot-state-broadcaster";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "ebf734c0dfa09b0fc29cde12b678fed4a099f0db";
    hash = "sha256-O+xQSbQsqCSVXhj9bcfgJjIgySt7nvNJjLCft6I5TRY=";
  };
  sourceRoot = "source/agimus_franka_robot_state_broadcaster";

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
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-flake8
    ament-cmake-gmock
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
    hardware-interface
    rclcpp
    ros2-control-test-assets
    xmllintPackageHook
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_robot_state_broadcaster for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

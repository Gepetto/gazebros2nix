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
  ament-cmake-gmock,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  hardware-interface,
  rclcpp,
  ros2-control-test-assets,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-cppcheck,
  ament-lint-cmake,
  ament-pep257,
  ament-xmllint,
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-franka-robot-state-broadcaster";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "866f340d2fc2216da00e89f3adf52720cc3dc1ad";
    hash = "sha256-jx4c1mJa9/pXsa+/ZhALftmLWEwcvDr3k4eS3h+tQ7Q=";
  };
  sourceRoot = "source/agimus_franka_robot_state_broadcaster";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
  ];
  buildInputs = [
    agimus-franka-hardware
    agimus-franka-msgs
    agimus-franka-semantic-components
    agimus-libfranka
    ament-cmake
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
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-gmock
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
    hardware-interface
    rclcpp
    ros2-control-test-assets
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-cppcheck
    ament-lint-cmake
    ament-pep257
    ament-xmllint
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

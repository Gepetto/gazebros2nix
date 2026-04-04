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

  # nativeCheckInputs
  ament-copyright,
  ament-cppcheck,
  ament-flake8,
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
    rev = "c6609fcd10b4a9fcad84a93c8c92af7e66c78405";
    hash = "sha256-+A03A5j+b75v9E+sLBOc5KvJ8tuBDUGCVQmFOskqYhY=";
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
  nativeCheckInputs = [
    ament-copyright
    ament-cppcheck
    ament-flake8
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

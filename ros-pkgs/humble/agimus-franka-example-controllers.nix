{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  writableTmpDirAsHomeHook,

  # buildInputs
  agimus-franka-hardware,
  agimus-franka-msgs,
  agimus-franka-semantic-components,
  agimus-libfranka,
  controller-interface,
  moveit-core,
  pinocchio,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  sensor-msgs,
  std-srvs,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-clang-tidy,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-gmock,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  controller-manager,
  hardware-interface-testing,
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
  pname = "ros-humble-agimus-franka-example-controllers";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "2719804b4ed7b2d4ef12d8ae4be34e0a5e1ac5cc";
    hash = "sha256-J5ebhKVkF3m/0RcRFXv+UTqLjRAQBhbpajrVsl+z1oo=";
  };
  sourceRoot = "source/agimus_franka_example_controllers";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    writableTmpDirAsHomeHook
  ];
  buildInputs = [
    agimus-franka-hardware
    agimus-franka-msgs
    agimus-franka-semantic-components
    agimus-libfranka
    ament-cmake
    controller-interface
    moveit-core
    pinocchio
    pluginlib
    rclcpp
    rclcpp-lifecycle
    sensor-msgs
    std-srvs
  ];
  propagatedBuildInputs = [
    agimus-franka-hardware
    agimus-franka-msgs
    agimus-franka-semantic-components
    agimus-libfranka
    controller-interface
    moveit-core
    pinocchio
    pluginlib
    rclcpp
    rclcpp-lifecycle
    sensor-msgs
    std-srvs
  ];
  checkInputs = [
    ament-cmake-clang-tidy
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-gmock
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
    controller-manager
    hardware-interface-testing
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
    description = "fork of franka_example_controllers for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

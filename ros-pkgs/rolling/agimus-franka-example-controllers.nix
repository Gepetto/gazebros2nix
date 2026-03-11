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
  ament-cmake-clang-format,
  ament-cmake-clang-tidy,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  controller-manager,
  hardware-interface-testing,
  ros2-control-test-assets,
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-franka-example-controllers";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "40e3f6073cf4cb2e6a990dba367207bdccc7ffeb";
    hash = "sha256-eZpLyhPiGmxFkS5/zlri4wxL2riTUpf2DR5vUaoAIEU=";
  };
  sourceRoot = "source/agimus_franka_example_controllers";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
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
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-cmake-clang-format
    ament-cmake-clang-tidy
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-flake8
    ament-cmake-gmock
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
    controller-manager
    hardware-interface-testing
    ros2-control-test-assets
  ];

  doCheck = true;

  meta = {
    description = "fork of agimus_franka_example_controllers for agimus_franka robots not maintained anymore by agimus_franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

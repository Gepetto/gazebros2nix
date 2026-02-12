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
  pname = "ros-humble-agimus-franka-example-controllers";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_franka_ros2";
    rev = "dac0a450f2e194daa5d30fbe74b851673991f5a1";
    hash = "sha256-BGPTtIbayOO/W0ByOI6yK5HLBtWciwq+FirG4JfK4Eo=";
  };
  sourceRoot = "source/franka_example_controllers";

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

  doCheck = false;

  meta = {
    description = "fork of franka_example_controllers for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_franka_ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

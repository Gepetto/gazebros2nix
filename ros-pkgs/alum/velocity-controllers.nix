{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  forward-command-controller,
  pluginlib,
  rclcpp,
  ros2-control-cmake,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  controller-manager,
  hardware-interface,
  hardware-interface-testing,
  ros2-control-test-assets,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-alum-velocity-controllers";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/velocity_controllers";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    backward-ros
    forward-command-controller
    pluginlib
    rclcpp
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    backward-ros
    forward-command-controller
    pluginlib
    rclcpp
  ];
  checkInputs = [
    ament-cmake-gmock
    controller-manager
    hardware-interface
    hardware-interface-testing
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Generic controller for forwarding commands.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

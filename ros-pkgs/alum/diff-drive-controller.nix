{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  control-toolbox,
  controller-interface,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rcpputils,
  realtime-tools,
  ros2-control-cmake,
  tf2,
  tf2-msgs,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  controller-manager,
  hardware-interface-testing,
  ros2-control-test-assets,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-alum-diff-drive-controller";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/diff_drive_controller";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake
    backward-ros
    control-toolbox
    controller-interface
    generate-parameter-library
    geometry-msgs
    hardware-interface
    nav-msgs
    pluginlib
    rclcpp
    rclcpp-lifecycle
    rcpputils
    realtime-tools
    ros2-control-cmake
    tf2
    tf2-msgs
  ];
  propagatedBuildInputs = [
    backward-ros
    control-toolbox
    controller-interface
    geometry-msgs
    hardware-interface
    nav-msgs
    pluginlib
    rclcpp
    rclcpp-lifecycle
    rcpputils
    realtime-tools
    tf2
    tf2-msgs
  ];
  checkInputs = [
    ament-cmake-gmock
    controller-manager
    hardware-interface-testing
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Controller for a differential-drive mobile base.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

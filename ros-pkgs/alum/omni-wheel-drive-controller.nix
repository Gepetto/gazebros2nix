{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  controller-interface,
  eigen,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  tf2,
  tf2-msgs,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  controller-manager,
  ros2-control-test-assets,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-omni-wheel-drive-controller";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/omni_wheel_drive_controller";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake
    controller-interface
    eigen
    generate-parameter-library
    geometry-msgs
    hardware-interface
    nav-msgs
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    ros2-control-cmake
    tf2
    tf2-msgs
  ];
  propagatedBuildInputs = [
    controller-interface
    eigen
    generate-parameter-library
    geometry-msgs
    hardware-interface
    nav-msgs
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    tf2
    tf2-msgs
  ];
  checkInputs = [
    ament-cmake-gmock
    controller-manager
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "A chainable controller for mobile robots with omnidirectional drive with three or
    more omni wheels.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

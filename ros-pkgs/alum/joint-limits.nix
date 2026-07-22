{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-gen-version-h,

  # buildInputs
  backward-ros,
  fmt,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  trajectory-msgs,
  urdf,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  generate-parameter-library,
  launch-ros,
  launch-testing-ament-cmake,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-joint-limits";
  version = "4.46.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-e0Y8CCl8/B80fLOXOePbjn1QRxFEi60W2IGTBhM2Qg4=";
  };
  sourceRoot = "source/joint_limits";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ament-cmake-gen-version-h
  ];
  buildInputs = [
    ament-cmake
    ament-cmake-gen-version-h
    backward-ros
    fmt
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    ros2-control-cmake
    trajectory-msgs
    urdf
  ];
  propagatedBuildInputs = [
    backward-ros
    fmt
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    trajectory-msgs
    urdf
  ];
  checkInputs = [
    ament-cmake-gmock
    generate-parameter-library
    launch-ros
    launch-testing-ament-cmake
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = false;

  meta = {
    description = "Package with interfaces for handling of joint limits in controllers or in hardware. The package also implements Saturation Joint Limiter for position-velocity-acceleration set and other individual interfaces.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

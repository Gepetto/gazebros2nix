{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-gen-version-h,

  # buildInputs
  backward-ros,
  control-msgs,
  fmt,
  joint-limits,
  lifecycle-msgs,
  pal-statistics,
  pluginlib,
  rclcpp-lifecycle,
  rcpputils,
  rcutils,
  realtime-tools,
  ros2-control-cmake,
  sdformat-urdf,
  tinyxml2-vendor,
  urdf,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  ros2-control-test-assets,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-alum-hardware-interface";
  version = "4.46.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-e0Y8CCl8/B80fLOXOePbjn1QRxFEi60W2IGTBhM2Qg4=";
  };
  sourceRoot = "source/hardware_interface";

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
    control-msgs
    fmt
    joint-limits
    lifecycle-msgs
    pal-statistics
    pluginlib
    rclcpp-lifecycle
    rcpputils
    rcutils
    realtime-tools
    ros2-control-cmake
    sdformat-urdf
    tinyxml2-vendor
    urdf
  ];
  propagatedBuildInputs = [
    backward-ros
    control-msgs
    fmt
    joint-limits
    lifecycle-msgs
    pal-statistics
    pluginlib
    rclcpp-lifecycle
    rcpputils
    rcutils
    realtime-tools
    sdformat-urdf
    tinyxml2-vendor
    urdf
  ];
  checkInputs = [
    ament-cmake-gmock
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "Base classes for hardware abstraction and tooling for them";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

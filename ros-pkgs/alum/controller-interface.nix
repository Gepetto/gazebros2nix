{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-gen-version-h,

  # buildInputs
  fmt,
  hardware-interface,
  joint-limits,
  lifecycle-msgs,
  pal-statistics,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,

  # propagatedBuildInputs
  geometry-msgs,
  sensor-msgs,
  std-msgs,

  # checkInputs
  ament-cmake-gmock,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-controller-interface";
  version = "4.49.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-wb3s95kNsBvMB3eT1NeuUEnjg612k13nkC4BqZ1h7K4=";
  };
  sourceRoot = "source/controller_interface";

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
    fmt
    hardware-interface
    joint-limits
    lifecycle-msgs
    pal-statistics
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    fmt
    geometry-msgs
    hardware-interface
    joint-limits
    lifecycle-msgs
    pal-statistics
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    sensor-msgs
    std-msgs
  ];
  checkInputs = [
    ament-cmake-gmock
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = false;

  meta = {
    description = "Base classes for controllers and syntax cookies for supporting common sensor types in controllers and broadcasters";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

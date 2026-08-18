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
  pal-statistics,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  geometry-msgs,
  sensor-msgs,
  std-msgs,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-controller-interface";
  version = "4.47.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-orjAU4K/bbbn62u7VXRDU99/HYkegVbFwDXSrvFZhY0=";
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
    pal-statistics
    rclcpp-lifecycle
    realtime-tools
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    hardware-interface
    rclcpp-lifecycle
    realtime-tools
  ];
  checkInputs = [
    ament-cmake-gmock
    geometry-msgs
    sensor-msgs
    std-msgs
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

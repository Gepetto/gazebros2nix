{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  boost,
  libcap,
  rclcpp,
  rclcpp-action,
  ros2-control-cmake,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  lifecycle-msgs,
  rclcpp-lifecycle,
  test-msgs,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-realtime-tools";
  version = "3.11.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "realtime_tools";
    tag = version;
    hash = "sha256-LnMXrA1Y0ok3XcabHwyrSkfVqByaT6PuzcxVpC9L+6s=";
  };
  sourceRoot = "source/realtime_tools";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    boost
    libcap
    rclcpp
    rclcpp-action
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    boost
    libcap
    rclcpp
    rclcpp-action
  ];
  checkInputs = [
    ament-cmake-gmock
    lifecycle-msgs
    rclcpp-lifecycle
    test-msgs
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = false;

  meta = {
    description = "Contains a set of tools that can be used from a hard
    realtime thread, without breaking the realtime behavior.";
    license = with lib.licenses; [ bsd3 ];
    homepage = "https://github.com/ros-controls/realtime_tools";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

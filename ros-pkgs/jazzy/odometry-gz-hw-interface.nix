{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  gz-ros2-control,
  hardware-interface,
  nav-msgs,
  pluginlib,
  rclcpp,

  # propagatedBuildInputs

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-odometry-gz-hw-interface";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "gep_tiago_pro_control_stack";
    rev = "f590708d89acd27a468c3e84e3bcdc8f9b11708c";
    hash = "sha256-R7t34wF/0euxxcCmUO2m+CpL5fR7hNHX5Y7YtIpWxTw=";
  };
  sourceRoot = "source/odometry_gz_hw_interface";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    gz-ros2-control
    hardware-interface
    nav-msgs
    pluginlib
    rclcpp
  ];
  propagatedBuildInputs = [
    gz-ros2-control
    hardware-interface
    nav-msgs
    pluginlib
    rclcpp
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Custom gz_ros2_control GazeboSimSystemInterface reading an Odometry topic.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/gep_tiago_pro_control_stack";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

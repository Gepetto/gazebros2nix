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
}:
buildRosPackage rec {
  pname = "ros-jazzy-odometry-gz-hw-interface";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "gep_tiago_pro_control_stack";
    rev = "29b10a5ad7319d0bc8434743b53e03a58c79aa7c";
    hash = "sha256-QhDoJUtSkn5uRYl6vbCkBn5etUZnkph6GowHWPIPk0k=";
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
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
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

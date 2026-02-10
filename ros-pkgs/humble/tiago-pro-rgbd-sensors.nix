{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  ament-index-python,
  diagnostic-updater,
  rclcpp-components,
  realsense2-camera,
  ros2launch,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-humble-tiago-pro-rgbd-sensors";
  version = "2.14.0";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "tiago_pro_navigation";
    tag = version;
    hash = "sha256-CWqmbPxE05r7TrQUAqXmk3gEK9QJYxhP9ROmifcQXHY=";
  };
  sourceRoot = "source/tiago_pro_rgbd_sensors";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    ament-index-python
    diagnostic-updater
    rclcpp-components
    realsense2-camera
    ros2launch
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = true;

  meta = {
    description = "tiago_pro-specific rgbd sensors launch and config files.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/tiago_pro_navigation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

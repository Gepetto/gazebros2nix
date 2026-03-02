{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs
  twist-stamper,

  # propagatedBuildInputs
  gz-plugins-vendor,
  gz-ros2-control,
  launch,
  launch-pal,
  launch-ros,
  omni-base-description,
  pal-gazebo-plugins,
  pal-gazebo-worlds,
  play-motion2-msgs,
  ros-gz-sim,
  tiago-2dnav,
  tiago-bringup,
  tiago-description,
  tiago-moveit-config,

  # checkInputs
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  launch-testing-ament-cmake,
  rclcpp,
  sensor-msgs,
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-gazebo";
  version = "4.1.9";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "tiago_simulation";
    rev = "d35cb5a4d08daeb64d529569db0a645a9ceb1348";
    hash = "sha256-J5KnB9v6brqFooORlDUbqNc70UUP58r8W7skwuosqdY=";
  };
  sourceRoot = "source/tiago_gazebo";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    twist-stamper
  ];
  propagatedBuildInputs = [
    gz-plugins-vendor
    gz-ros2-control
    launch
    launch-pal
    launch-ros
    omni-base-description
    pal-gazebo-plugins
    pal-gazebo-worlds
    play-motion2-msgs
    ros-gz-sim
    tiago-2dnav
    tiago-bringup
    tiago-description
    tiago-moveit-config
  ];
  checkInputs = [
    ament-cmake-gtest
    ament-lint-auto
    ament-lint-common
    launch-testing-ament-cmake
    rclcpp
    sensor-msgs
  ];

  doCheck = false;

  meta = {
    description = "The tiago_gazebo package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/tiago_simulation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  launch-pal,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners-chomp,
  moveit-planners-ompl,
  moveit-ros-control-interface,
  moveit-ros-move-group,
  moveit-ros-perception,
  moveit-ros-visualization,
  pal-sea-arm-description,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-sea-arm-moveit-config";
  version = "1.0.5";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "pal_sea_arm_moveit_config";
    rev = "839ca7df939ab20c7cdb9b953d52af02c66b9877";
    hash = "sha256-dD6KRaZUgtGatI4NrdF9hrYoZvccYjCl7xVWQKHsPJM=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    launch-pal
    moveit-configs-utils
    moveit-kinematics
    moveit-planners-chomp
    moveit-planners-ompl
    moveit-ros-control-interface
    moveit-ros-move-group
    moveit-ros-perception
    moveit-ros-visualization
    pal-sea-arm-description
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "An automatically generated package with all the configuration and launch files for using the pal_sea_arm with the MoveIt Motion Planning Framework";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/pal_sea_arm_moveit_config";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

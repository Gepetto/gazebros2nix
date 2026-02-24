{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  launch-pal,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners-ompl,
  moveit-ros-control-interface,
  moveit-ros-move-group,
  moveit-ros-perception,
  moveit-ros-visualization,
  tiago-description,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-moveit-config";
  version = "3.0.18";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "tiago_moveit_config";
    rev = "2ff8816bf839bef73a1e6d057da4300b58351da0";
    hash = "sha256-KwY3kPdqcgKPK7MJghxhEkwUFks1+xLJQFqzJgbOUy4=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    launch-pal
    moveit-configs-utils
    moveit-kinematics
    moveit-planners-ompl
    moveit-ros-control-interface
    moveit-ros-move-group
    moveit-ros-perception
    moveit-ros-visualization
    tiago-description
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "An automatically generated package with all the configuration and launch files for using the tiago with the MoveIt Motion Planning Framework";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/tiago_moveit_config";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

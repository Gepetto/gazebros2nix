{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  geometry-msgs,
  joy-linux,
  joy-teleop,
  launch-pal,
  pmb2-controller-configuration,
  pmb2-description,
  robot-state-publisher,
  twist-mux,
  twist-mux-msgs,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-pmb2-bringup";
  version = "5.0.26";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pmb2_robot";
    rev = "984ac253d667ef0757348eaefcbb4404d599e575";
    hash = "sha256-Wonz2lRRb09m2G4IInkAepTH9zvUyJQY0nC8WLtDUdk=";
  };
  sourceRoot = "source/pmb2_bringup";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    geometry-msgs
    joy-linux
    joy-teleop
    launch-pal
    pmb2-controller-configuration
    pmb2-description
    robot-state-publisher
    twist-mux
    twist-mux-msgs
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "Launch files and scripts needed to bring up the ROS nodes of a PMB2 robot.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pmb2_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

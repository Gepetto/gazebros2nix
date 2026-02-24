{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-laser-sensors";
  version = "4.2.0";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "tiago_navigation";
    rev = "280353f804da563ab44435eed703461675741583";
    hash = "sha256-FKZqkVNpsG12PL8Z9dZp8kuPi/zh1h+uo92H3pknS+A=";
  };
  sourceRoot = "source/tiago_laser_sensors";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "Launch files and scripts needed to bring up the ROS nodes of a TIAGo robot.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/tiago_navigation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

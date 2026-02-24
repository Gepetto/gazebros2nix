{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  launch-pal,
  nav2-bringup,
  pal-maps,
  pmb2-laser-sensors,
  ros2launch,
  rviz2,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-pmb2-2dnav";
  version = "4.5.0";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pmb2_navigation";
    rev = "4e15ad3bcc6d0df4df752ee8837bfec949c25e46";
    hash = "sha256-ZxwVosoaWIHL4+DRv80IBY53BXV6RuO6KKmysHIlNuU=";
  };
  sourceRoot = "source/pmb2_2dnav";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    launch-pal
    nav2-bringup
    pal-maps
    pmb2-laser-sensors
    ros2launch
    rviz2
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "PMB2-specific launch files needed to run
    navigation on the PMB2 robot.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pmb2_navigation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

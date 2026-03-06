{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  ament-cmake-auto,

  # propagatedBuildInputs

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-br2-gazebo-worlds";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "br2_gazebo_worlds";
    rev = "b9df295cda6fe0dc6392880166a138f2e853cc6a";
    hash = "sha256-ehRDdpvV+/hK/fVbdzd4RpYLu5vbgzQcFhvkWSVL/jg=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake-auto
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "Simulation worlds for Book ROS 2.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/br2_gazebo_worlds";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

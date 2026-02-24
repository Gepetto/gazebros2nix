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
  pname = "ros-jazzy-pal-gazebo-worlds";
  version = "4.0.4";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pal_gazebo_worlds";
    rev = "7c65b7c68e71b4b5e364c3e6ce18227c8d0a0b12";
    hash = "sha256-AEPSHQZv9cOyE0kmAXWxAaGiYEMex+chnvYztuG9te8=";
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
    description = "Simulation worlds for PAL robots.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pal_gazebo_worlds";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

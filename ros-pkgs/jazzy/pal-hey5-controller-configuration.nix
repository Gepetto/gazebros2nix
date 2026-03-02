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
  pname = "ros-jazzy-pal-hey5-controller-configuration";
  version = "4.1.0";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pal_hey5";
    rev = "37e8c5428ba642ed0e686cdd64a8b3929fe3fdd5";
    hash = "sha256-3I7SbD8CyyaioBbardnfg9cBXj0lQr/ui5aVrSOssRs=";
  };
  sourceRoot = "source/pal_hey5_controller_configuration";

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
    description = "The pal_hey5_controller_configuration package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pal_hey5";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

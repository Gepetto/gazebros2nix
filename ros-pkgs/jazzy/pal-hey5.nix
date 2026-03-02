{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  pal-hey5-controller-configuration,
  pal-hey5-description,

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-hey5";
  version = "4.1.0";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pal_hey5";
    rev = "37e8c5428ba642ed0e686cdd64a8b3929fe3fdd5";
    hash = "sha256-3I7SbD8CyyaioBbardnfg9cBXj0lQr/ui5aVrSOssRs=";
  };
  sourceRoot = "source/pal_hey5";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    pal-hey5-controller-configuration
    pal-hey5-description
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The pal_hey5 package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pal_hey5";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

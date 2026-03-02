{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  tiago-bringup,
  tiago-controller-configuration,
  tiago-description,

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-robot";
  version = "4.2.20";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "tiago_robot";
    rev = "bc2ac55a0be2c49ccca6e09f6ff533902c9fb8e2";
    hash = "sha256-iaGv8DQAcI732xo/zBFs+7HOYdgtSc1/OaNK+mGWk4Y=";
  };
  sourceRoot = "source/tiago_robot";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    tiago-bringup
    tiago-controller-configuration
    tiago-description
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Description and controller configuration of TIAGo";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/tiago_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

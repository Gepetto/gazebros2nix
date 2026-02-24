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
  play-motion2,
  teleop-tools-msgs,
  tiago-controller-configuration,
  tiago-description,
  twist-mux,
  twist-mux-msgs,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-bringup";
  version = "4.2.20";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "tiago_robot";
    rev = "bc2ac55a0be2c49ccca6e09f6ff533902c9fb8e2";
    hash = "sha256-iaGv8DQAcI732xo/zBFs+7HOYdgtSc1/OaNK+mGWk4Y=";
  };
  sourceRoot = "source/tiago_bringup";

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
    play-motion2
    teleop-tools-msgs
    tiago-controller-configuration
    tiago-description
    twist-mux
    twist-mux-msgs
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "Launch files to upload the robot description and start the controllers";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/tiago_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  br2-gazebo-worlds,
  omni-base-robot,
  pal-gripper,
  pal-gripper-simulation,
  pal-hey5,
  pal-robotiq-gripper,
  pmb2-navigation,
  pmb2-robot,
  tiago-launch,
  tiago-navigation,
  tiago-robot,
  tiago-simulation,

  # propagatedBuildInputs

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-harmonic";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "tiago_harmonic";
    rev = "835892d534c3f5bb7996ae7a50a5a1f06fc99f7e";
    hash = "sha256-RmerkmvZKI2pbvAsM5l9vHuetGmXXazS2aVZ7PnDGcA=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    br2-gazebo-worlds
    omni-base-robot
    pal-gripper
    pal-gripper-simulation
    pal-hey5
    pal-robotiq-gripper
    pmb2-navigation
    pmb2-robot
    tiago-launch
    tiago-navigation
    tiago-robot
    tiago-simulation
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Tiago Harmonic";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/tiago_harmonic";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

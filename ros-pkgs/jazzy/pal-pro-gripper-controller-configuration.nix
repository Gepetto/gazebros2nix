{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  controller-manager,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-pal,
  launch-ros,
  pal-pro-gripper-wrapper,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-pro-gripper-controller-configuration";
  version = "1.11.4";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "pal_pro_gripper";
    rev = "cf7e2c7c234943cd6a7e7f62737a68e02d8cdb45";
    hash = "sha256-3K4hFHEhk8n47tgBmcIa3zNm3YZNqbiq1jLp3dmlAiQ=";
  };
  sourceRoot = "source/pal_pro_gripper_controller_configuration";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    controller-manager
    joint-state-broadcaster
    joint-trajectory-controller
    launch
    launch-pal
    launch-ros
    pal-pro-gripper-wrapper
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "The pal_pro_gripper_controller_configuration package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/pal_pro_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

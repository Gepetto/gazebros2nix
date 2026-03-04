{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  pal-pro-gripper-controller-configuration,
  pal-pro-gripper-description,

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-pro-gripper";
  version = "1.11.4";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "pal_pro_gripper";
    rev = "cf7e2c7c234943cd6a7e7f62737a68e02d8cdb45";
    hash = "sha256-3K4hFHEhk8n47tgBmcIa3zNm3YZNqbiq1jLp3dmlAiQ=";
  };
  sourceRoot = "source/pal_pro_gripper";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    pal-pro-gripper-controller-configuration
    pal-pro-gripper-description
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The pal_pro_gripper package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/pal_pro_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

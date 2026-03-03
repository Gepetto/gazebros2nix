{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-python,

  # buildInputs
  rclpy,
  sensor-msgs,
  trajectory-msgs,

  # propagatedBuildInputs

  # checkInputs
  ament-copyright,
  ament-flake8,
  ament-lint-auto,
  ament-lint-common,
  ament-pep257,
  python3Packages,
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-pro-gripper-wrapper";
  version = "1.11.4";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "pal_pro_gripper";
    rev = "cf7e2c7c234943cd6a7e7f62737a68e02d8cdb45";
    hash = "sha256-3K4hFHEhk8n47tgBmcIa3zNm3YZNqbiq1jLp3dmlAiQ=";
  };
  sourceRoot = "source/pal_pro_gripper_wrapper";

  buildType = "ament_python";

  nativeBuildInputs = [
    ament-cmake-python
  ];
  buildInputs = [
    rclpy
    sensor-msgs
    trajectory-msgs
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-copyright
    ament-flake8
    ament-lint-auto
    ament-lint-common
    ament-pep257
    python3Packages.pytest
  ];

  doCheck = true;

  meta = {
    description = "Grasp controller to close with a determined error on position only
    so to skip overheating.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/pal_pro_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-pro-gripper-wrapper";
  version = "1.11.4";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "pal_pro_gripper";
    rev = "52b918ed364e8f033979d6f81bb57072c368f034";
    hash = "sha256-WZX2cjcm3G2moHeiCIMCW379tLfeSFo7edd2MrklfPw=";
  };
  sourceRoot = "source/pal_pro_gripper_wrapper";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
    ament-cmake-python
  ];
  buildInputs = [
    ament-cmake-python
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
  nativeCheckInputs = [
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

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  controller-manager,
  joint-trajectory-controller,
  position-controllers,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-gripper-controller-configuration";
  version = "3.2.0";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pal_gripper";
    rev = "f696b11183cec43fe050778c26fd5043d831eb85";
    hash = "sha256-rXxnPaxMOB9y3FZEhZ+TuH/d9bPi+dJumCs286b4VK4=";
  };
  sourceRoot = "source/pal_gripper_controller_configuration";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    controller-manager
    joint-trajectory-controller
    position-controllers
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "The pal_gripper_controller_configuration package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pal_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  catkin,

  # buildInputs

  # propagatedBuildInputs
  pal-gripper-description,
  pal-hardware-gazebo,

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-gripper-gazebo";
  version = "1.0.3";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pal_gripper";
    rev = "f696b11183cec43fe050778c26fd5043d831eb85";
    hash = "sha256-rXxnPaxMOB9y3FZEhZ+TuH/d9bPi+dJumCs286b4VK4=";
  };
  sourceRoot = "source/pal_gripper_gazebo";

  buildType = "catkin";

  nativeBuildInputs = [
    catkin
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    pal-gripper-description
    pal-hardware-gazebo
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The pal_gripper_gazebo package";
    license = with lib.licenses; [ unfree ];
    homepage = "https://github.com/Tiago-Harmonic/pal_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

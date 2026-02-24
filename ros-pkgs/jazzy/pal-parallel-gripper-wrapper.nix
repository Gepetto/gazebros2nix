{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  catkin,

  # buildInputs
  actionlib,
  control-msgs,
  rospy,
  trajectory-msgs,

  # propagatedBuildInputs
  ddynamic-reconfigure-python,

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-parallel-gripper-wrapper";
  version = "1.0.3";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pal_gripper";
    rev = "f696b11183cec43fe050778c26fd5043d831eb85";
    hash = "sha256-rXxnPaxMOB9y3FZEhZ+TuH/d9bPi+dJumCs286b4VK4=";
  };
  sourceRoot = "source/pal_parallel_gripper_wrapper";

  buildType = "catkin";

  nativeBuildInputs = [
    catkin
  ];
  buildInputs = [
    actionlib
    control-msgs
    rospy
    trajectory-msgs
  ];
  propagatedBuildInputs = [
    ddynamic-reconfigure-python
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The pal_parallel_gripper_wrapper package";
    license = with lib.licenses; [ unfree ];
    homepage = "https://github.com/Tiago-Harmonic/pal_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

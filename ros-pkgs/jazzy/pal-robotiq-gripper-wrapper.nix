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
  pname = "ros-jazzy-pal-robotiq-gripper-wrapper";
  version = "0.0.19";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pal_robotiq_gripper";
    tag = version;
    hash = "sha256-7UoktbBdi/rQZXd/av5+zRjD0+hJdP7aUjzE9VbVm2Q=";
  };
  sourceRoot = "source/pal_robotiq_gripper_wrapper";

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
    description = "The pal_robotiq_gripper_wrapper package";
    license = with lib.licenses; [ unfree ];
    homepage = "https://github.com/Tiago-Harmonic/pal_robotiq_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

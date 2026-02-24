{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  catkin,

  # buildInputs

  # propagatedBuildInputs
  xacro,

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-robotiq-epick-description";
  version = "0.0.19";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pal_robotiq_gripper";
    tag = version;
    hash = "sha256-7UoktbBdi/rQZXd/av5+zRjD0+hJdP7aUjzE9VbVm2Q=";
  };
  sourceRoot = "source/pal_robotiq_epick_gripper/pal_robotiq_epick_description";

  buildType = "catkin";

  nativeBuildInputs = [
    catkin
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    xacro
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The pal_robotiq_epick_description package";
    license = with lib.licenses; [ unfree ];
    homepage = "https://github.com/Tiago-Harmonic/pal_robotiq_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

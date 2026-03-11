{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  agimus-franka-description,
  agimus-franka-ign-ros2-control,
  joint-state-publisher-gui,
  ros-gz,
  sdformat-urdf,

  # propagatedBuildInputs
  ros2controlcli,

  # checkInputs
  ament-lint-auto,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-gazebo-bringup";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "40e3f6073cf4cb2e6a990dba367207bdccc7ffeb";
    hash = "sha256-eZpLyhPiGmxFkS5/zlri4wxL2riTUpf2DR5vUaoAIEU=";
  };
  sourceRoot = "source/agimus_franka_gazebo/agimus_franka_gazebo_bringup";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    agimus-franka-description
    agimus-franka-ign-ros2-control
    joint-state-publisher-gui
    ros-gz
    sdformat-urdf
  ];
  propagatedBuildInputs = [
    ros2controlcli
  ];
  checkInputs = [
    ament-lint-auto
  ];

  doCheck = true;

  meta = {
    description = "fork of agimus_franka_gazebo_bringup for agimus_franka robots not maintained anymore by agimus_franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

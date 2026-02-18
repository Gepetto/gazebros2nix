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
    repo = "agimus_franka_ros2";
    rev = "b4450db350c8ea796eef77290e81b09654f766bb";
    hash = "sha256-HRQJ9gx184+9+3GIfRnDcUuTMj/K8D/Ps2Ygje6OZdk=";
  };
  sourceRoot = "source/franka_gazebo/franka_gazebo_bringup";

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

  doCheck = false;

  meta = {
    description = "fork of franka_gazebo_bringup for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_franka_ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

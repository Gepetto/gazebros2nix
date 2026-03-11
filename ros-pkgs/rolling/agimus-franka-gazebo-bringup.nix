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
  pname = "ros-rolling-agimus-franka-gazebo-bringup";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "ebf734c0dfa09b0fc29cde12b678fed4a099f0db";
    hash = "sha256-O+xQSbQsqCSVXhj9bcfgJjIgySt7nvNJjLCft6I5TRY=";
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
    description = "fork of franka_gazebo_bringup for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

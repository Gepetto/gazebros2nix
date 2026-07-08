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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-gazebo-bringup";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "8a05aced1fae55a09b3f019b6d2645ef45cf002d";
    hash = "sha256-+LMsdt14tBKIlo0KnfCYFoiYyFYYP4a1QkeEtpzRAIM=";
  };
  sourceRoot = "source/agimus_franka_gazebo/agimus_franka_gazebo_bringup";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    agimus-franka-description
    agimus-franka-ign-ros2-control
    ament-cmake
    joint-state-publisher-gui
    ros-gz
    sdformat-urdf
  ];
  propagatedBuildInputs = [
    agimus-franka-description
    agimus-franka-ign-ros2-control
    joint-state-publisher-gui
    ros-gz
    ros2controlcli
    sdformat-urdf
  ];
  checkInputs = [
    ament-lint-auto
  ];
  nativeCheckInputs = [
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

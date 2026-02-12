{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,
  ament-cmake-python,

  # buildInputs
  generate-parameter-library,
  generate-parameter-library-py,

  # propagatedBuildInputs
  agimus-franka-description,
  agimus-franka-gripper,
  agimus-franka-hardware,
  agimus-franka-ign-ros2-control,
  agimus-franka-robot-state-broadcaster,
  controller-manager,
  force-torque-sensor-broadcaster,
  gripper-controllers,
  joint-state-broadcaster,
  joint-state-publisher,
  linear-feedback-controller,
  linear-feedback-controller-msgs,
  net-ft-description,
  net-ft-diagnostic-broadcaster,
  net-ft-driver,
  plotjuggler,
  plotjuggler-msgs,
  plotjuggler-ros,
  python3Packages,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-sim,
  ros2controlcli,
  ros2launch,
  rviz2,
  xacro,

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-demos-common";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "29b88ff791fed647cb7cf1c61522a06919ddc9a1";
    hash = "sha256-ftgLbwij0dh3Pgi8xG+cGHJ1cIVC3xlGJzjCsQhg38g=";
  };
  sourceRoot = "source/agimus_demos_common";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
  ];
  buildInputs = [
    generate-parameter-library
    generate-parameter-library-py
  ];
  propagatedBuildInputs = [
    agimus-franka-description
    agimus-franka-gripper
    agimus-franka-hardware
    agimus-franka-ign-ros2-control
    agimus-franka-robot-state-broadcaster
    controller-manager
    force-torque-sensor-broadcaster
    gripper-controllers
    joint-state-broadcaster
    joint-state-publisher
    linear-feedback-controller
    linear-feedback-controller-msgs
    net-ft-description
    net-ft-diagnostic-broadcaster
    net-ft-driver
    plotjuggler
    plotjuggler-msgs
    plotjuggler-ros
    python3Packages.jinja2
    robot-state-publisher
    ros-gz-bridge
    ros-gz-sim
    ros2controlcli
    ros2launch
    rviz2
    xacro
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Common launch and config files used across all demos created for Agimus Project.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

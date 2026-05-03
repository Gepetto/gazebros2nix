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
  topic-tools,
  xacro,

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-demos-common";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "35e6dff44a08baa39125b006659c0e48c450c657";
    hash = "sha256-zcS8UK8MW3K6EBTwoy6zekp1KDTHGOKvJqm+OTOOUMQ=";
  };
  sourceRoot = "source/agimus_demos_common";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake-auto
    ament-cmake-python
    generate-parameter-library
    generate-parameter-library-py
  ];
  propagatedBuildInputs = [
    agimus-franka-description
    agimus-franka-gripper
    agimus-franka-hardware
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
    topic-tools
    xacro
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
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

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  ackermann-steering-controller,
  admittance-controller,
  bicycle-steering-controller,
  chained-filter-controller,
  diff-drive-controller,
  effort-controllers,
  force-torque-sensor-broadcaster,
  forward-command-controller,
  gpio-controllers,
  gps-sensor-broadcaster,
  gripper-controllers,
  imu-sensor-broadcaster,
  joint-state-broadcaster,
  joint-trajectory-controller,
  magnetometer-broadcaster,
  mecanum-drive-controller,
  omni-wheel-drive-controller,
  parallel-gripper-controller,
  pid-controller,
  pose-broadcaster,
  position-controllers,
  range-sensor-broadcaster,
  state-interfaces-broadcaster,
  steering-controllers-library,
  tricycle-controller,
  tricycle-steering-controller,
  velocity-controllers,

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-ros2-controllers";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/ros2_controllers";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
  ];
  propagatedBuildInputs = [
    ackermann-steering-controller
    admittance-controller
    bicycle-steering-controller
    chained-filter-controller
    diff-drive-controller
    effort-controllers
    force-torque-sensor-broadcaster
    forward-command-controller
    gpio-controllers
    gps-sensor-broadcaster
    gripper-controllers
    imu-sensor-broadcaster
    joint-state-broadcaster
    joint-trajectory-controller
    magnetometer-broadcaster
    mecanum-drive-controller
    omni-wheel-drive-controller
    parallel-gripper-controller
    pid-controller
    pose-broadcaster
    position-controllers
    range-sensor-broadcaster
    state-interfaces-broadcaster
    steering-controllers-library
    tricycle-controller
    tricycle-steering-controller
    velocity-controllers
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Metapackage for ros2_controllers related packages";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  rosidl-default-generators,

  # buildInputs
  action-msgs,
  builtin-interfaces,
  geometry-msgs,
  sensor-msgs,
  std-msgs,
  trajectory-msgs,

  # propagatedBuildInputs
  rosidl-default-runtime,

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-alum-control-msgs";
  version = "5.9.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "control_msgs";
    tag = version;
    hash = "sha256-fODL6D1Ia5fJf/Ca4nI83+2pzI/e7XDq2hhfZFMxWQE=";
  };
  sourceRoot = "source/control_msgs";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    rosidl-default-generators
  ];
  buildInputs = [
    action-msgs
    ament-cmake
    builtin-interfaces
    geometry-msgs
    rosidl-default-generators
    sensor-msgs
    std-msgs
    trajectory-msgs
  ];
  propagatedBuildInputs = [
    action-msgs
    builtin-interfaces
    geometry-msgs
    rosidl-default-runtime
    sensor-msgs
    std-msgs
    trajectory-msgs
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "control_msgs contains base messages and actions useful for
    controlling robots. It provides representations for controller
    setpoints and joint and cartesian trajectories.";
    license = with lib.licenses; [ bsd3 ];
    homepage = "https://github.com/ros-controls/control_msgs";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

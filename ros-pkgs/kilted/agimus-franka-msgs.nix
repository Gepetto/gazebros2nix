{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  action-msgs,
  builtin-interfaces,
  geometry-msgs,
  rosidl-default-generators,
  sensor-msgs,
  std-msgs,

  # propagatedBuildInputs
  rosidl-default-runtime,

  # checkInputs
  ament-lint-common,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-franka-msgs";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "c6609fcd10b4a9fcad84a93c8c92af7e66c78405";
    hash = "sha256-+A03A5j+b75v9E+sLBOc5KvJ8tuBDUGCVQmFOskqYhY=";
  };
  sourceRoot = "source/agimus_franka_msgs";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    action-msgs
    ament-cmake
    builtin-interfaces
    geometry-msgs
    rosidl-default-generators
    sensor-msgs
    std-msgs
  ];
  propagatedBuildInputs = [
    action-msgs
    builtin-interfaces
    geometry-msgs
    rosidl-default-runtime
    sensor-msgs
    std-msgs
  ];
  checkInputs = [
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_msgs for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  rosidl-default-generators,

  # buildInputs
  builtin-interfaces,
  lifecycle-msgs,
  std-msgs,

  # propagatedBuildInputs
  rosidl-default-runtime,

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-controller-manager-msgs";
  version = "4.49.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-wb3s95kNsBvMB3eT1NeuUEnjg612k13nkC4BqZ1h7K4=";
  };
  sourceRoot = "source/controller_manager_msgs";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    rosidl-default-generators
  ];
  buildInputs = [
    ament-cmake
    builtin-interfaces
    lifecycle-msgs
    rosidl-default-generators
    std-msgs
  ];
  propagatedBuildInputs = [
    builtin-interfaces
    lifecycle-msgs
    rosidl-default-runtime
    std-msgs
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Messages and services for the controller manager.";
    license = with lib.licenses; [ unfree ];
    homepage = "https://github.com/ros-controls/ros2_control";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

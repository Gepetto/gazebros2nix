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
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-franka-msgs";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "f86c1247e95d06dac4d46d8d799290463e8c2651";
    hash = "sha256-jPphQtp89HZMVdUfLi06cbMUhO8bCcXUquRD6OujJao=";
  };
  sourceRoot = "source/agimus_franka_msgs";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    action-msgs
    builtin-interfaces
    geometry-msgs
    rosidl-default-generators
    sensor-msgs
    std-msgs
  ];
  propagatedBuildInputs = [
    rosidl-default-runtime
  ];
  checkInputs = [
    ament-lint-common
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

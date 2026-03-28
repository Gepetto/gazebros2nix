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
    rev = "927a0393961fb4b27c9d1e5815955e132b7bf3b3";
    hash = "sha256-nVPTHD6i5i+UfAXnyCPe29OmdCnWJw5dlDKGu0CjghU=";
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
    rosidl-default-runtime
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

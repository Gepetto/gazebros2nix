{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  rosidl-default-generators,

  # buildInputs
  std-msgs,

  # propagatedBuildInputs
  rosidl-default-runtime,

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-motkin-dual-motor-testbed-msgs";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "motkin-dual-motor-testbed-robot";
    tag = "v${version}";
    hash = "sha256-xSp2/KlOReis2AaLKqJjMEd/7BfmfrGBFG3HfobqBqM=";
  };
  sourceRoot = "source/motkin_dual_motor_testbed_msgs";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    rosidl-default-generators
  ];
  buildInputs = [
    ament-cmake
    rosidl-default-generators
    std-msgs
  ];
  propagatedBuildInputs = [
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
    description = "Messages for the MOTKIN dual motor testbed robot.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Gepetto/motkin-dual-motor-testbed-robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

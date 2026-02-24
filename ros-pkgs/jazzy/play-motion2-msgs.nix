{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  action-msgs,
  builtin-interfaces,
  rosidl-default-generators,

  # propagatedBuildInputs
  rosidl-default-runtime,

  # checkInputs
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-play-motion2-msgs";
  version = "1.5.1";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "play_motion2";
    rev = "bf8f54640ac27215a3e93e9bd06fbe4cd8c72ced";
    hash = "sha256-ZIQju0qigUlp1gbClm849Vxl10gqjczX/W/zY6zXB+g=";
  };
  sourceRoot = "source/play_motion2_msgs";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    action-msgs
    builtin-interfaces
    rosidl-default-generators
  ];
  propagatedBuildInputs = [
    rosidl-default-runtime
  ];
  checkInputs = [
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "Play a pre-recorded motion on a robot";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/play_motion2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

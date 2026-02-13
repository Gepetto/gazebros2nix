{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  action-msgs,
  geometry-msgs,
  rosidl-default-generators,
  std-msgs,

  # propagatedBuildInputs
  rosidl-default-runtime,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-msgs";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_msgs";
    rev = "ff368e6466034cf1a75d816a76960b580752d45d";
    hash = "sha256-p6VlN6g+Fw+wfh2YX5vesN9wvF2oymFosE1x8vzukgs=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    action-msgs
    geometry-msgs
    rosidl-default-generators
    std-msgs
  ];
  propagatedBuildInputs = [
    rosidl-default-runtime
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = true;

  meta = {
    description = "Agimus project ROS messages";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus_msgs";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

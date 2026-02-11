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
  pname = "ros-kilted-agimus-msgs";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_msgs";
    rev = "241d82d5bcffac00de83397c29347ab5bce45088";
    hash = "sha256-gOTxAqOKx7B+tpaDrhEOf+0afWUBQj3RVXeIDZb0+nE=";
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
    license = with lib.licenses; [ unfree ];
    homepage = "https://github.com/agimus-project/agimus_msgs";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

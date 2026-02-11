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
  pname = "ros-rolling-agimus-msgs";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_msgs";
    rev = "bda290a8d9f3e0f4d5dab67e6e21a31af3856a68";
    hash = "sha256-Xniqj0fJvU3zUDSHqk3eP3f8ZLQVbIa+M+LZWd7VCyY=";
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

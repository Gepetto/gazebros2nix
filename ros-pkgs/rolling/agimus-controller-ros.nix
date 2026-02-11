{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs
  agimus-controller,
  agimus-msgs,
  builtin-interfaces,
  generate-parameter-library,
  geometry-msgs,
  linear-feedback-controller-msgs,
  rclpy,
  std-msgs,
  xacro,

  # propagatedBuildInputs
  launch,
  launch-ros,
  pinocchio,
  python3Packages,

  # checkInputs
  ament-copyright,
  ament-flake8,
  ament-pep257,
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-controller-ros";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_controller";
    rev = "931c58f28e38b8b6ef72d6ab33c1807e1f4b3cbd";
    hash = "sha256-e+l7fBv035ST99jY1O90/8Yoh9+lpEpPYnfEhDr9Lls=";
  };
  sourceRoot = "source/agimus_controller_ros";

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
    agimus-controller
    agimus-msgs
    builtin-interfaces
    generate-parameter-library
    geometry-msgs
    linear-feedback-controller-msgs
    rclpy
    std-msgs
    xacro
  ];
  propagatedBuildInputs = [
    launch
    launch-ros
    pinocchio
    python3Packages.numpy
  ];
  checkInputs = [
    ament-copyright
    ament-flake8
    ament-pep257
    python3Packages.pytest
  ];

  doCheck = true;

  meta = {
    description = "The agimus_controller package";
    license = with lib.licenses; [ bsd3 ];
    homepage = "https://github.com/agimus-project/agimus_controller";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

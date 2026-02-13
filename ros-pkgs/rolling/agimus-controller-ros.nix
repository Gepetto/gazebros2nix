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
    rev = "f0ac8192ab973c9817f0178b0780f21d87e642e4";
    hash = "sha256-2/tiTqHEip5D76j3VC5uvzqjFv2wTw0wYQRUO5lspkw=";
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

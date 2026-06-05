{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs
  builtin-interfaces,
  generate-parameter-library,
  geometry-msgs,
  linear-feedback-controller-msgs,
  rclpy,
  std-msgs,
  xacro,

  # propagatedBuildInputs
  agimus-controller,
  agimus-msgs,
  launch,
  launch-ros,
  pinocchio,
  python3Packages,

  # checkInputs
  ament-copyright,
  ament-flake8,
  ament-pep257,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-controller-ros";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-controller";
    rev = "b11188aa58194ba03fd7528cc94bfb49cfa71ecd";
    hash = "sha256-hFNPv21GTZyz69fU31WjxwZmP9P6HsATZF6ILgX3gRw=";
  };
  sourceRoot = "source/agimus_controller_ros";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
    generate-parameter-library
  ];
  buildInputs = [
    builtin-interfaces
    generate-parameter-library
    geometry-msgs
    linear-feedback-controller-msgs
    rclpy
    std-msgs
    xacro
  ];
  propagatedBuildInputs = [
    agimus-controller
    agimus-msgs
    builtin-interfaces
    geometry-msgs
    launch
    launch-ros
    linear-feedback-controller-msgs
    pinocchio
    python3Packages.numpy
    rclpy
    std-msgs
    xacro
  ];
  checkInputs = [
    ament-copyright
    ament-flake8
    ament-pep257
    python3Packages.pytest
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The agimus_controller package";
    license = with lib.licenses; [ bsd3 ];
    homepage = "https://github.com/agimus-project/agimus-controller";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

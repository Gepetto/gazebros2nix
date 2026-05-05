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
  pname = "ros-kilted-agimus-controller-ros";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_controller";
    rev = "752f2bc2a4b4f2a49ebca29937ef6c0dd75c45b7";
    hash = "sha256-T2gWfpwT9ZTvr+K5BkKGpBmuFWfgHregLjnTlmy79S8=";
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
    homepage = "https://github.com/agimus-project/agimus_controller";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

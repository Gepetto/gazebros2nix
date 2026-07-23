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
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-controller-ros";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-controller";
    rev = "630372d699f65d8175588937213637350e1b2bdc";
    hash = "sha256-CFJIMPMJU4SLQi4AHYAed+Qje7X5rvfltAnz4FO/Zyg=";
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
    writableTmpDirAsHomeHook
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

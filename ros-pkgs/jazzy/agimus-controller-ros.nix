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
  pname = "ros-jazzy-agimus-controller-ros";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_controller";
    rev = "5f96b6a5688416b14ef7f93cfe10b8cd5d21ff19";
    hash = "sha256-xcnLYdGaAkVTRUlSiyMnjYHDgMpa6nr6N401QP3NQpc=";
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

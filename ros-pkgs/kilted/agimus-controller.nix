{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs

  # propagatedBuildInputs
  coal,
  colmpc,
  crocoddyl,
  example-robot-data,
  mim-solvers,
  pinocchio,
  python3Packages,
  xacro,

  # checkInputs
  agimus-franka-description,
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-controller";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_controller";
    rev = "5f96b6a5688416b14ef7f93cfe10b8cd5d21ff19";
    hash = "sha256-xcnLYdGaAkVTRUlSiyMnjYHDgMpa6nr6N401QP3NQpc=";
  };
  sourceRoot = "source/agimus_controller";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    coal
    colmpc
    crocoddyl
    example-robot-data
    mim-solvers
    pinocchio
    python3Packages.numpy
    xacro
  ];
  checkInputs = [
    agimus-franka-description
    ament-copyright
    ament-flake8
    ament-index-python
    ament-pep257
    python3Packages.pytest
    python3Packages.pyyaml
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

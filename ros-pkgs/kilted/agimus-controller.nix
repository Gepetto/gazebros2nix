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
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-controller";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-controller";
    rev = "630372d699f65d8175588937213637350e1b2bdc";
    hash = "sha256-CFJIMPMJU4SLQi4AHYAed+Qje7X5rvfltAnz4FO/Zyg=";
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

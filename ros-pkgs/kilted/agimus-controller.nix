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
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-controller";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_controller";
    rev = "931c58f28e38b8b6ef72d6ab33c1807e1f4b3cbd";
    hash = "sha256-e+l7fBv035ST99jY1O90/8Yoh9+lpEpPYnfEhDr9Lls=";
  };
  sourceRoot = "source/agimus_controller";

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

  doCheck = true;

  meta = {
    description = "The agimus_controller package";
    license = with lib.licenses; [ bsd3 ];
    homepage = "https://github.com/agimus-project/agimus_controller";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

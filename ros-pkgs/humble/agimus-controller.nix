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
  pname = "ros-humble-agimus-controller";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_controller";
    rev = "f0ac8192ab973c9817f0178b0780f21d87e642e4";
    hash = "sha256-2/tiTqHEip5D76j3VC5uvzqjFv2wTw0wYQRUO5lspkw=";
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

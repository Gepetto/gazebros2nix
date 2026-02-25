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
    rev = "cf96c9312877477005888af86019fa6d1225b96e";
    hash = "sha256-rWWhmWUQW/wtbQfHfeRhEsVO07PDhVtvlUTlGQNL4qI=";
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

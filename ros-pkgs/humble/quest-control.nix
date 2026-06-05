{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  v4l-utils,

  # buildInputs
  agimus-controller,
  agimus-demo-08-collision-avoidance,
  agimus-demos-common,
  agimus-franka-msgs,
  agimus-msgs,
  control-msgs,
  geometry-msgs,
  linear-feedback-controller-msgs,
  pinocchio,
  python3Packages,

  # propagatedBuildInputs

  # checkInputs
  ament-copyright,
  ament-flake8,
  ament-pep257,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-quest-control";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "Quest-Teleoperation-Panda";
    rev = "16a5fa7c0699ac77addd04dfdb64e9cc5bd52922";
    hash = "sha256-+hfTuQONbUdkhrmZUcXzpz8KQxFjqJjf4QEt9ToFItI=";
  };
  sourceRoot = "source/quest_control";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
    v4l-utils
  ];
  buildInputs = [
    agimus-controller
    agimus-demo-08-collision-avoidance
    agimus-demos-common
    agimus-franka-msgs
    agimus-msgs
    control-msgs
    geometry-msgs
    linear-feedback-controller-msgs
    pinocchio
    python3Packages.h5py
    python3Packages.numpy
    python3Packages.opencv4
    python3Packages.scipy
  ];
  propagatedBuildInputs = [
    agimus-controller
    agimus-demo-08-collision-avoidance
    agimus-demos-common
    agimus-franka-msgs
    agimus-msgs
    control-msgs
    geometry-msgs
    linear-feedback-controller-msgs
    pinocchio
    python3Packages.h5py
    python3Packages.numpy
    python3Packages.opencv4
    python3Packages.pyarrow
    python3Packages.scipy
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
    description = "Teleoperation on the Panda Robot with Quest 3";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Gepetto/Quest-Teleoperation-Panda";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

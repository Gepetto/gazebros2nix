{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  v4l-utils,

  # buildInputs
  agimus-controller,
  agimus-controller-ros,
  agimus-demo-03-mpc-dummy-traj,
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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-quest-control";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "Quest-Teleoperation-Panda";
    rev = "f09f37c221bd3a526ee90dcc91db9a14871fca1a";
    hash = "sha256-oA4R56XldID3tl00ZKhVlKjndok6I9VfwYhKyCrTxfc=";
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
    agimus-controller-ros
    agimus-demo-03-mpc-dummy-traj
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
    agimus-controller-ros
    agimus-demo-03-mpc-dummy-traj
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

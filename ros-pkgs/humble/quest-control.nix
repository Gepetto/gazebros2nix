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
    owner = "nim65s";
    repo = "Quest-Teleoperation-Panda";
    rev = "0ba480309e9c9252c9981bf742f856fd98f318c0";
    hash = "sha256-IdG6JrVqBQ9TRnBrGqZgVwt+xC5jbs+0gS6tQiDo4ac=";
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
    homepage = "https://github.com/nim65s/Quest-Teleoperation-Panda";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

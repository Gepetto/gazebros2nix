{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  agimus-controller-ros,
  agimus-demos-common,
  ros2launch,

  # checkInputs
  ament-lint-auto,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-demo-03-mpc-dummy-traj";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "105f9d51f9c94a0cf5879d6f4c4673aca39f3ba5";
    hash = "sha256-UA8p5EiWL1ETQ22q7vyKbtBzX+D0z73JHdO1qFsM5KI=";
  };
  sourceRoot = "source/agimus_demo_03_mpc_dummy_traj";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    ament-cmake-auto
  ];
  propagatedBuildInputs = [
    agimus-controller-ros
    agimus-demos-common
    ros2launch
  ];
  checkInputs = [
    ament-lint-auto
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "agimus_demo_03_mpc_dummy_traj contains the entry points for a simple Panda demo with
    LFC and a MPC sending commands while following a dummy trajectory.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

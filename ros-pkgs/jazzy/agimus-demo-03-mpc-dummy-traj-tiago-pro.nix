{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  agimus-demos-common,
  ros2launch,

# checkInputs

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-demo-03-mpc-dummy-traj-tiago-pro";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "40c897103f651d07bca480dd2a4b5a73270fb454";
    hash = "sha256-IIsTWCocu65UatuQniHmlt8JBlAck/LXvXlZMURsgtg=";
  };
  sourceRoot = "source/agimus_demo_03_mpc_dummy_traj_tiago_pro";

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
    agimus-demos-common
    ros2launch
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "agimus_demo_03_mpc_dummy_traj_tiago_pro contains the entry points for a simple TIAGo pal-robotics
    demo with the LFC and an MPC following a dummy trajectory.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

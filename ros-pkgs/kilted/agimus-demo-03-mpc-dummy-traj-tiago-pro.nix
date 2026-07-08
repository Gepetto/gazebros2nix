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
  pname = "ros-kilted-agimus-demo-03-mpc-dummy-traj-tiago-pro";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "302ac9fdf5a85dd991e3796c4089e09d9cabbec3";
    hash = "sha256-5uLPiWbv/xMnb7ZIiyVeANJdv1W/aKhMqm6fRioq4ik=";
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

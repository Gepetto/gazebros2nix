{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  agimus-demos-common,
  linear-feedback-controller,
  ros2launch,

  # checkInputs
  ament-lint-auto,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-demo-02-simple-pd-plus";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "29b88ff791fed647cb7cf1c61522a06919ddc9a1";
    hash = "sha256-ftgLbwij0dh3Pgi8xG+cGHJ1cIVC3xlGJzjCsQhg38g=";
  };
  sourceRoot = "source/agimus_demo_02_simple_pd_plus";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    agimus-demos-common
    linear-feedback-controller
    ros2launch
  ];
  checkInputs = [
    ament-lint-auto
  ];

  doCheck = true;

  meta = {
    description = "agimus_demo_02_simple_pd_plus contains the entry points for a simple Panda demo with the LFC and a LFC client that implements a PD+ with Ricatti gains.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

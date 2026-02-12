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
  python3Packages,
  ros2launch,
  xterm,

  # checkInputs
  ament-lint-auto,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-demo-06-regrasp";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "29b88ff791fed647cb7cf1c61522a06919ddc9a1";
    hash = "sha256-ftgLbwij0dh3Pgi8xG+cGHJ1cIVC3xlGJzjCsQhg38g=";
  };
  sourceRoot = "source/agimus_demo_06_regrasp";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    agimus-demos-common
    linear-feedback-controller
    python3Packages.ipython
    ros2launch
    xterm
  ];
  checkInputs = [
    ament-lint-auto
  ];

  doCheck = true;

  meta = {
    description = "The purpose of this demo is to use the AGIMUS architecture to regrasp an object.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

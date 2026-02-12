{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  agimus-demo-09-glue-spreading,
  agimus-demos-common,
  ros2launch,

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-demo-04-dual-arm-tiago-pro";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "29b88ff791fed647cb7cf1c61522a06919ddc9a1";
    hash = "sha256-ftgLbwij0dh3Pgi8xG+cGHJ1cIVC3xlGJzjCsQhg38g=";
  };
  sourceRoot = "source/agimus_demo_04_dual_arm_tiago_pro";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    agimus-demo-09-glue-spreading
    agimus-demos-common
    ros2launch
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "agimus_demo_04_dual_arm_tiago_pro contains implements scripts to manipulate a rod
    with TIAGo-Pro pal-robotics.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

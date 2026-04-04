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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-demo-04-dual-arm-tiago-pro";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "7fee3010b7112236c5cb7bc2592c1f3c16af676e";
    hash = "sha256-+ziFTYWWKrhyLwY3qlpltieePkbwCXN5ftd2i4rQ3lo=";
  };
  sourceRoot = "source/agimus_demo_04_dual_arm_tiago_pro";

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
    agimus-demo-09-glue-spreading
    agimus-demos-common
    ros2launch
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
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

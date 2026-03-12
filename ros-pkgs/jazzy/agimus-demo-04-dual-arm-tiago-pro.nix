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
  pname = "ros-jazzy-agimus-demo-04-dual-arm-tiago-pro";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "40c897103f651d07bca480dd2a4b5a73270fb454";
    hash = "sha256-IIsTWCocu65UatuQniHmlt8JBlAck/LXvXlZMURsgtg=";
  };
  sourceRoot = "source/agimus_demo_04_dual_arm_tiago_pro";

  __structuredAttrs = true;
  strictDeps = true;

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

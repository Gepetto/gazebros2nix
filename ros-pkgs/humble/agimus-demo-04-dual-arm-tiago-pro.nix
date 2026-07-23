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
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-demo-04-dual-arm-tiago-pro";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "302ac9fdf5a85dd991e3796c4089e09d9cabbec3";
    hash = "sha256-5uLPiWbv/xMnb7ZIiyVeANJdv1W/aKhMqm6fRioq4ik=";
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
    writableTmpDirAsHomeHook
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

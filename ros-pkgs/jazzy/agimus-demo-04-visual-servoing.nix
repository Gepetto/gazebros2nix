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

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-demo-04-visual-servoing";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "302ac9fdf5a85dd991e3796c4089e09d9cabbec3";
    hash = "sha256-5uLPiWbv/xMnb7ZIiyVeANJdv1W/aKhMqm6fRioq4ik=";
  };
  sourceRoot = "source/agimus_demo_04_visual_servoing";

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
    linear-feedback-controller
    ros2launch
  ];
  checkInputs = [
    ament-lint-auto
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "This demo shows the visual servoing capabilities of the AGIMUS architecture.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

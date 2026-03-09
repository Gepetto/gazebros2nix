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
  pname = "ros-jazzy-agimus-demo-04-visual-servoing";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "40c897103f651d07bca480dd2a4b5a73270fb454";
    hash = "sha256-IIsTWCocu65UatuQniHmlt8JBlAck/LXvXlZMURsgtg=";
  };
  sourceRoot = "source/agimus_demo_04_visual_servoing";

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
    description = "This demo shows the visual servoing capabilities of the AGIMUS architecture.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

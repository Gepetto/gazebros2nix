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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-demo-05-pick-and-place";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "105f9d51f9c94a0cf5879d6f4c4673aca39f3ba5";
    hash = "sha256-UA8p5EiWL1ETQ22q7vyKbtBzX+D0z73JHdO1qFsM5KI=";
  };
  sourceRoot = "source/agimus_demo_05_pick_and_place";

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
    python3Packages.ipython
    ros2launch
    xterm
  ];
  checkInputs = [
    ament-lint-auto
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The purpose of this demo is to use the AGIMUS architecture to unbox some objects.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

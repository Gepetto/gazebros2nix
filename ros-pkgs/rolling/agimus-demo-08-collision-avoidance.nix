{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs
  generate-parameter-library,
  generate-parameter-library-py,

  # propagatedBuildInputs
  agimus-demos-common,
  linear-feedback-controller,
  ros2launch,

  # checkInputs
  ament-lint-auto,

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-demo-08-collision-avoidance";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "40c897103f651d07bca480dd2a4b5a73270fb454";
    hash = "sha256-IIsTWCocu65UatuQniHmlt8JBlAck/LXvXlZMURsgtg=";
  };
  sourceRoot = "source/agimus_demo_08_collision_avoidance";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake-auto
    generate-parameter-library
    generate-parameter-library-py
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
  ];

  doCheck = true;

  meta = {
    description = "agimus_demo_08_collision_avoidance contains the entry points for a demo showcasing Panda performing simple task while performing dynamic collision avoidance.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

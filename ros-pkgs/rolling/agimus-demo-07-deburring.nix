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
  agimus-demos-controllers,
  agimus-pytroller,
  linear-feedback-controller,
  python3Packages,
  ros2launch,

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-demo-07-deburring";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "40c897103f651d07bca480dd2a4b5a73270fb454";
    hash = "sha256-IIsTWCocu65UatuQniHmlt8JBlAck/LXvXlZMURsgtg=";
  };
  sourceRoot = "source/agimus_demo_07_deburring";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    generate-parameter-library
    generate-parameter-library-py
  ];
  propagatedBuildInputs = [
    agimus-demos-common
    agimus-demos-controllers
    agimus-pytroller
    linear-feedback-controller
    python3Packages.tqdm
    ros2launch
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Demo performing force-feedback deburring task on Panda robot.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

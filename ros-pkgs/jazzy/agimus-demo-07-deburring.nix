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

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-demo-07-deburring";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "8bb84651288dca5bd786bff7c26b913fbac5d850";
    hash = "sha256-jEyOUZB7nYR/32gPkibsTkm90oppGVS5L3OYLOFLBBs=";
  };
  sourceRoot = "source/agimus_demo_07_deburring";

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
    agimus-demos-controllers
    agimus-pytroller
    linear-feedback-controller
    python3Packages.tqdm
    ros2launch
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
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

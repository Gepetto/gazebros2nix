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
  pname = "ros-humble-agimus-demo-07-deburring";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "29b88ff791fed647cb7cf1c61522a06919ddc9a1";
    hash = "sha256-ftgLbwij0dh3Pgi8xG+cGHJ1cIVC3xlGJzjCsQhg38g=";
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

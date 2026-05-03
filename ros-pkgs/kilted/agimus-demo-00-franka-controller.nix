{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  agimus-demos-common,
  agimus-franka-example-controllers,
  controller-manager,
  ros2launch,

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-demo-00-franka-controller";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "35e6dff44a08baa39125b006659c0e48c450c657";
    hash = "sha256-zcS8UK8MW3K6EBTwoy6zekp1KDTHGOKvJqm+OTOOUMQ=";
  };
  sourceRoot = "source/agimus_demo_00_franka_controller";

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
    agimus-franka-example-controllers
    controller-manager
    ros2launch
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "agimus_demo_00_franka_controller contains the entry points for a simple Panda controller.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

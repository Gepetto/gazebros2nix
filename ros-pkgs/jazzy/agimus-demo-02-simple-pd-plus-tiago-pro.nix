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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-demo-02-simple-pd-plus-tiago-pro";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "35e6dff44a08baa39125b006659c0e48c450c657";
    hash = "sha256-zcS8UK8MW3K6EBTwoy6zekp1KDTHGOKvJqm+OTOOUMQ=";
  };
  sourceRoot = "source/agimus_demo_02_simple_pd_plus_tiago_pro";

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
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "agimus_demo_02_simple_pd_plus_tiago_pro contains the entry points for a simple TIAGo pal-robotics
    demo with the LFC and a LFC client that implements a PD+ with Ricatti gains.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

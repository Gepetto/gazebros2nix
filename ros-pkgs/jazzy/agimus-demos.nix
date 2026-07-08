{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs

  # propagatedBuildInputs
  agimus-demo-00-franka-controller,
  agimus-demo-01-lfc-alone,
  agimus-demo-02-simple-pd-plus,
  agimus-demo-03-mpc-dummy-traj,
  agimus-demo-05-pick-and-place,
  agimus-demos-common,

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-demos";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "302ac9fdf5a85dd991e3796c4089e09d9cabbec3";
    hash = "sha256-5uLPiWbv/xMnb7ZIiyVeANJdv1W/aKhMqm6fRioq4ik=";
  };
  sourceRoot = "source/agimus_demos";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    agimus-demo-00-franka-controller
    agimus-demo-01-lfc-alone
    agimus-demo-02-simple-pd-plus
    agimus-demo-03-mpc-dummy-traj
    agimus-demo-05-pick-and-place
    agimus-demos-common
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "A package to aggregate all packages in agimus_demos.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

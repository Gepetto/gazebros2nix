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
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-demos";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "29b88ff791fed647cb7cf1c61522a06919ddc9a1";
    hash = "sha256-ftgLbwij0dh3Pgi8xG+cGHJ1cIVC3xlGJzjCsQhg38g=";
  };
  sourceRoot = "source/agimus_demos";

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

  doCheck = true;

  meta = {
    description = "A package to aggregate all packages in agimus_demos.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

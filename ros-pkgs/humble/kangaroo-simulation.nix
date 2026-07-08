{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  kangaroo-mujoco,

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-kangaroo-simulation";
  version = "2.6.1";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "kangaroo_simulation";
    tag = version;
    hash = "sha256-9p61humn6WCg5HC6k04sjwkqgW+th1ca5L07pfLhHeU=";
  };
  sourceRoot = "source/kangaroo_simulation";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
  ];
  propagatedBuildInputs = [
    kangaroo-mujoco
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The kangaroo_simulation metapackage";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/kangaroo_simulation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

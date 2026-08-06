{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  kangaroo-bringup,
  kangaroo-controller-configuration,
  kangaroo-description,

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-kangaroo-robot";
  version = "2.15.0";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "kangaroo_robot";
    tag = version;
    hash = "sha256-ocHhrTH8Xm1r5bkVyYUg5s86n8WSjRE5PlOeKgiL4Ng=";
  };
  sourceRoot = "source/kangaroo_robot";

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
    kangaroo-bringup
    kangaroo-controller-configuration
    kangaroo-description
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "The kangaroo_robot package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/kangaroo_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

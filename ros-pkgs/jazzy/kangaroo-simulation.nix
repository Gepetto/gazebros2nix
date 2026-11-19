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
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-kangaroo-simulation";
  version = "2.8.1";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "kangaroo_simulation";
    tag = version;
    hash = "sha256-+jrzEtnC1GY4mq6w2kwYBI3XQ7W4HbOzvmwdjQwcy2k=";
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
    writableTmpDirAsHomeHook
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

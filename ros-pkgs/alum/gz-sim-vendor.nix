{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-core,
  ament-cmake-test,
  ament-cmake-vendor-package,
  cmake,

  # buildInputs
  freeglut,
  freeimage,
  gbenchmark,
  glew,
  gz-cmake-vendor,
  gz-common-vendor,
  gz-fuel-tools-vendor,
  gz-gui-vendor,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-physics-vendor,
  gz-plugin-vendor,
  gz-rendering-vendor,
  gz-sensors-vendor,
  gz-tools-vendor,
  gz-transport-vendor,
  gz-utils-vendor,
  libxi,
  libxmu,
  protobuf,
  python3Packages,
  qt5,
  sdformat-vendor,
  tinyxml-2,
  util-linux,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  xmllintPackageHook,
  xorg,

  # nativeCheckInputs
  ament-copyright,
  ament-lint-cmake,
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-gz-sim-vendor";
  version = "0.0.12";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_sim_vendor";
    tag = version;
    hash = "sha256-JqW9A+N2fUJZ7ypN/fodBOXtGzi2ZcnLx6hA8T28DTY=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-core
    ament-cmake-test
    ament-cmake-vendor-package
    cmake
  ];
  buildInputs = [
    ament-cmake-core
    ament-cmake-test
    ament-cmake-vendor-package
    cmake
    freeglut
    freeimage
    gbenchmark
    glew
    gz-cmake-vendor
    gz-common-vendor
    gz-fuel-tools-vendor
    gz-gui-vendor
    gz-math-vendor
    gz-msgs-vendor
    gz-physics-vendor
    gz-plugin-vendor
    gz-rendering-vendor
    gz-sensors-vendor
    gz-tools-vendor
    gz-transport-vendor
    gz-utils-vendor
    libxi
    libxmu
    protobuf
    python3Packages.pybind11
    qt5.qtbase
    qt5.qtdeclarative
    qt5.qtgraphicaleffects
    qt5.qtquickcontrols
    qt5.qtquickcontrols2
    sdformat-vendor
    tinyxml-2
    util-linux
  ];
  propagatedBuildInputs = [
    freeglut
    freeimage
    gbenchmark
    glew
    gz-cmake-vendor
    gz-common-vendor
    gz-fuel-tools-vendor
    gz-gui-vendor
    gz-math-vendor
    gz-msgs-vendor
    gz-physics-vendor
    gz-plugin-vendor
    gz-rendering-vendor
    gz-sensors-vendor
    gz-tools-vendor
    gz-transport-vendor
    gz-utils-vendor
    libxi
    libxmu
    protobuf
    python3Packages.pybind11
    qt5.qtbase
    qt5.qtdeclarative
    qt5.qtgraphicaleffects
    qt5.qtquickcontrols
    qt5.qtquickcontrols2
    sdformat-vendor
    tinyxml-2
    util-linux
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-lint-cmake
    ament-cmake-xmllint
    python3Packages.pytest
    xorg.xorgserver
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-lint-cmake
    ament-xmllint
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Vendor package for: gz-sim8 8.15.0

    Gazebo Sim : A Robotic Simulator";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/gz_sim_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

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
  gz-cmake-vendor,
  gz-common-vendor,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-plugin-vendor,
  gz-rendering-vendor,
  gz-tools-vendor,
  gz-transport-vendor,
  gz-utils-vendor,
  protobuf,
  qt5,
  tinyxml-2,

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
  pname = "ros-alum-gz-gui-vendor";
  version = "0.0.5";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_gui_vendor";
    tag = version;
    hash = "sha256-mLAZI/HO+IzYuoMldZdz804iWG2GjSl4tQAwGm40cBs=";
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
    gz-cmake-vendor
    gz-common-vendor
    gz-math-vendor
    gz-msgs-vendor
    gz-plugin-vendor
    gz-rendering-vendor
    gz-tools-vendor
    gz-transport-vendor
    gz-utils-vendor
    protobuf
    qt5.qtbase
    qt5.qtcharts
    qt5.qtdeclarative
    qt5.qtgraphicaleffects
    qt5.qtlocation
    qt5.qtpositioning
    qt5.qtquickcontrols
    qt5.qtquickcontrols2
    tinyxml-2
  ];
  propagatedBuildInputs = [
    gz-cmake-vendor
    gz-common-vendor
    gz-math-vendor
    gz-msgs-vendor
    gz-plugin-vendor
    gz-rendering-vendor
    gz-tools-vendor
    gz-transport-vendor
    gz-utils-vendor
    protobuf
    qt5.qtbase
    qt5.qtcharts
    qt5.qtdeclarative
    qt5.qtgraphicaleffects
    qt5.qtlocation
    qt5.qtpositioning
    qt5.qtquickcontrols
    qt5.qtquickcontrols2
    tinyxml-2
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-lint-cmake
    ament-cmake-xmllint
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
    description = "Vendor package for: gz-gui8 8.4.0

    Gazebo GUI : Graphical interfaces for robotics applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/gz_gui_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

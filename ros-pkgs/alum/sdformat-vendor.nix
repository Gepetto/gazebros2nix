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
  gz-math-vendor,
  gz-tools-vendor,
  gz-utils-vendor,
  python3Packages,
  tinyxml-2,
  urdfdom,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  libxml2,
  xmllintPackageHook,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
  ament-copyright,
  ament-lint-cmake,
  ament-xmllint,
}:
buildRosPackage rec {
  pname = "ros-alum-sdformat-vendor";
  version = "0.0.11";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "sdformat_vendor";
    tag = version;
    hash = "sha256-i8oVA8vGztyetwwzh1CaLsvMDGGVWe4cXUSU1BL6yCs=";
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
    gz-math-vendor
    gz-tools-vendor
    gz-utils-vendor
    python3Packages.pybind11
    tinyxml-2
    urdfdom
  ];
  propagatedBuildInputs = [
    gz-cmake-vendor
    gz-math-vendor
    gz-tools-vendor
    gz-utils-vendor
    python3Packages.pybind11
    tinyxml-2
    urdfdom
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-lint-cmake
    ament-cmake-xmllint
    libxml2
    python3Packages.psutil
    python3Packages.pytest
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
    ament-copyright
    ament-lint-cmake
    ament-xmllint
  ];

  doCheck = true;

  meta = {
    description = "Vendor package for: sdformat14 14.9.0

    SDFormat is an XML file format that describes environments, objects, and robots
in a manner suitable for robotic applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/sdformat_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

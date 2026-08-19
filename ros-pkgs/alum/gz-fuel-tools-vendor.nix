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
  curl,
  gflags,
  gz-cmake-vendor,
  gz-common-vendor,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-tools-vendor,
  gz-utils-vendor,
  jsoncpp,
  libyaml,
  libzip,
  tinyxml-2,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-lint-cmake,
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-gz-fuel-tools-vendor";
  version = "0.0.6";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_fuel_tools_vendor";
    tag = version;
    hash = "sha256-azHOZTGwbUs6hc9upFUswrT3nFGgkpxNxFC4tFxJAmI=";
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
    curl
    gflags
    gz-cmake-vendor
    gz-common-vendor
    gz-math-vendor
    gz-msgs-vendor
    gz-tools-vendor
    gz-utils-vendor
    jsoncpp
    libyaml
    libzip
    tinyxml-2
  ];
  propagatedBuildInputs = [
    curl
    gflags
    gz-cmake-vendor
    gz-common-vendor
    gz-math-vendor
    gz-msgs-vendor
    gz-tools-vendor
    gz-utils-vendor
    jsoncpp
    libyaml
    libzip
    tinyxml-2
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-lint-cmake
    ament-cmake-xmllint
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
    description = "Vendor package for: gz-fuel_tools9 9.1.1

    Gazebo Fuel Tools: Classes and tools for interacting with Gazebo Fuel";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/gz_fuel_tools_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

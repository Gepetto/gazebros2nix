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

  # propagatedBuildInputs
  ruby,

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
  pname = "ros-alum-gz-tools-vendor";
  version = "0.0.8";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_tools_vendor";
    tag = version;
    hash = "sha256-/HhW8bdAWuV6BjelFxKfxRpzTt6OhxSt8G/9ZXsXXxo=";
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
  ];
  propagatedBuildInputs = [
    gz-cmake-vendor
    ruby
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
    description = "Vendor package for: gz-tools2 2.0.4

    Gazebo Tools: Entrypoint to Gazebo's command line interface";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/gz_tools_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

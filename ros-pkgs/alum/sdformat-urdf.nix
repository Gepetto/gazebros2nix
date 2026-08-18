{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-ros,

  # buildInputs
  pluginlib,
  rcutils,
  sdformat-vendor,
  tinyxml2-vendor,
  urdf,
  urdf-parser-plugin,
  urdfdom-headers,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  sdformat-test-files,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-cppcheck,
  ament-cpplint,
  ament-flake8,
  ament-lint-cmake,
  ament-pep257,
  ament-uncrustify,
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-sdformat-urdf";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "ros";
    repo = "sdformat_urdf";
    tag = version;
    hash = "sha256-Lt2OlG5neiGGgvc0JvM9uEhYa++aiwJHptonbYaAqVo=";
  };
  sourceRoot = "source/sdformat_urdf";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-ros
  ];
  buildInputs = [
    ament-cmake-ros
    pluginlib
    rcutils
    sdformat-vendor
    tinyxml2-vendor
    urdf
    urdf-parser-plugin
    urdfdom-headers
  ];
  propagatedBuildInputs = [
    pluginlib
    rcutils
    sdformat-vendor
    tinyxml2-vendor
    urdf
    urdf-parser-plugin
    urdfdom-headers
  ];
  checkInputs = [
    ament-cmake-gtest
    ament-lint-auto
    ament-lint-common
    sdformat-test-files
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-cpplint
    ament-cmake-flake8
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-uncrustify
    ament-cmake-xmllint
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-cppcheck
    ament-cpplint
    ament-flake8
    ament-lint-cmake
    ament-pep257
    ament-uncrustify
    ament-xmllint
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "URDF plugin to parse SDFormat XML into URDF C++ DOM objects.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros/sdformat_urdf";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

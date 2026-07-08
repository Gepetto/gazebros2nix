{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  cmake,

  # buildInputs

  # propagatedBuildInputs

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-alum-sdformat-test-files";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "ros";
    repo = "sdformat_urdf";
    tag = version;
    hash = "sha256-Lt2OlG5neiGGgvc0JvM9uEhYa++aiwJHptonbYaAqVo=";
  };
  sourceRoot = "source/sdformat_test_files";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "cmake";

  nativeBuildInputs = [
    cmake
  ];
  buildInputs = [
    cmake
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Example SDFormat XML files for testing tools using hthis format.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros/sdformat_urdf";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

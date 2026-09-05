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
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-libfranka-common";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-libfranka-common";
    rev = "6aabe34259e86aa6503787766d96b859999fc00b";
    hash = "sha256-pvqnPZLXxJOaMmoaLUtdfQtvAt1PygjmV3xte24kPT4=";
  };
  sourceRoot = "source/";

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
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "fork of libfranka-common for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-libfranka-common";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

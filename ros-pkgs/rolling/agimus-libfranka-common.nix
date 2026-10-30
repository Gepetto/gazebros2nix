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
  pname = "ros-rolling-agimus-libfranka-common";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-libfranka-common";
    rev = "8e99180441bdf9f64ad923e97f13513c3e3134cc";
    hash = "sha256-a/OIzSWHS8XHV20y1CRTwrvpJJOjdXIRXGK6SrAaE7Y=";
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

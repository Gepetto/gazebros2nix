{
  lib,
  stdenv,
  fetchFromGitHub,

  cli11,
  cmake,
  gz-cmake,
  pkg-config,
  python3,
  spdlog,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-rotary-gz-utils5";
  version = "5.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-utils";
    tag = "gz-utils5_5.0.0-pre2";
    hash = "sha256-8zZyO+iBn+6bQ1oy6S78XP9jEIcMqQWhAni1bOdlXFE=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    cli11
    gz-cmake
    spdlog
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    cli11
    spdlog
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = true;

  meta = {
    description = "Gazebo Utils : Classes and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-utils";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

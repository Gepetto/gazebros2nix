{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  pkg-config,
  python3,
  spdlog,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-utils3";
  version = "3.2.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-utils";
    tag = "gz-utils3_3.2.0";
    hash = "sha256-G0Wog6S4RASkalhwSOawU/0DjZlsoYHBf6y/oDLRfdc=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    gz-cmake
    spdlog
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
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

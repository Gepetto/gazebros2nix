{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  eigen,
  gz-cmake,
  gz-utils,
  gz-utils2,
  pkg-config,
  python3,
  python3Packages,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-math7";
  version = "7.7.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-math";
    tag = "gz-math7_7.7.0";
    hash = "sha256-51/covBxpiTuBlowjJW7zl0CD/pfEFB/N1u9vbg6F2A=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    eigen
    gz-cmake
    gz-utils
    gz-utils2
  ];
  checkInputs = [
    python3Packages.pytest
  ];
  nativeCheckInputs = [
    eigen
    gz-utils2
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = true;

  meta = {
    description = "Gazebo Math : Math classes and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-math";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

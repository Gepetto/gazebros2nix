{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  eigen,
  gz-utils,
  ign-cmake,
  ign-utils,
  pkg-config,
  python3,
  python3Packages,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-math6";
  version = "6.17.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-math";
    tag = "ignition-math6_6.17.0";
    hash = "sha256-siSJXaxeFQ5B1Tr7vSuJlDK6DaBBJupAzLeCmtjh9Uw=";
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
    ign-cmake
    ign-utils
  ];
  checkInputs = [
    python3Packages.pytest
  ];
  nativeCheckInputs = [
    eigen
    gz-utils
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = true;

  meta = {
    description = "Gazebo Math : Math classes and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-math";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

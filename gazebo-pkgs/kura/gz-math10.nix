{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  eigen,
  gz-cmake,
  gz-utils,
  pkg-config,
  python3,
  python3Packages,
}:
stdenv.mkDerivation {
  pname = "gz-kura-gz-math10";
  version = "10.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-math";
    tag = "gz-math10_10.0.0-pre1";
    hash = "sha256-OMoWL1zMaWiKteUrEx+MtHdmsFIwxvbp0nei3s1lrn4=";
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
  ];
  checkInputs = [
    python3Packages.pytest
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

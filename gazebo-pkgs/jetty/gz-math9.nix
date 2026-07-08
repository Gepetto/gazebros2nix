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
  pname = "gz-jetty-gz-math9";
  version = "9.2.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-math";
    tag = "gz-math9_9.2.0";
    hash = "sha256-54SfQNeYbM18QeCnTpQnK9FGTHg2ROybFTo+xPHXVAI=";
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

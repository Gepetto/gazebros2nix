{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  gz-tools,
  gz-utils,
  pkg-config,
  python3,
}:
stdenv.mkDerivation {
  pname = "gz-rotary-gz-plugin5";
  version = "5.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-plugin";
    tag = "gz-plugin5_5.0.0-pre1";
    hash = "sha256-K9DNJSQ6JBKdMv2zmhrDOrTWF6V3N2C7gTVGZWj/Ues=";
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
    gz-tools
    gz-utils
  ];
  checkInputs = [
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Plugin : Cross-platform C++ library for dynamically loading plugins.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-plugin";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

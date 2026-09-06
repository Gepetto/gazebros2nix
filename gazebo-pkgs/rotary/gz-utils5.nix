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
}:
stdenv.mkDerivation {
  pname = "gz-rotary-gz-utils5";
  version = "5.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-utils";
    tag = "gz-utils5_5.0.0-pre1";
    hash = "sha256-/pLT3oYucFWr5QvGH5m84nOlyJ35ByzypO2D302UqOc=";
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

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = true;

  meta = {
    description = "Gazebo Utils : Classes and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-utils";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

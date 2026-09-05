{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  pkg-config,
  python3,
  rubocop,
  ruby,
}:
stdenv.mkDerivation {
  pname = "gz-rotary-gz-tools3";
  version = "3.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-tools";
    tag = "gz-tools3_3.0.0-pre1";
    hash = "sha256-U4cCw24IAdMfrtvOVoB3inD/URyNIxqb1G4l0zkhmnw=";
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
    ruby
  ];
  checkInputs = [
    rubocop
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Tools: Entrypoint to Gazebo's command line interface";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-tools";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

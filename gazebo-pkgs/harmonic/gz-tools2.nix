{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  pkg-config,
  rubocop,
  ruby,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-tools2";
  version = "2.0.2";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-tools";
    tag = "gz-tools2_2.0.2";
    hash = "sha256-CY+W1jWIkszKwKuLgKmJpZMXHn0RnueMHFSDhOXIzLg=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
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

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
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-tools2";
  version = "2.0.4";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-tools";
    tag = "gz-tools2_2.0.4";
    hash = "sha256-WVeZg7Wreqz0eScbrgELEAsmpfr1Dy7HogZFjGEht/I=";
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
  nativeCheckInputs = [
    ruby
    writableTmpDirAsHomeHook
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

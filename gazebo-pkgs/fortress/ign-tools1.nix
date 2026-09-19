{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  pkg-config,
  python3,
  rubocop,
  ruby,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-tools1";
  version = "1.5.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-tools";
    tag = "ignition-tools_1.5.0";
    hash = "sha256-HgYT7MARRnOdUuUllxRn9pl7tsWO5RDIFDObzJQgZpc=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
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
  doInstallCheck = false;

  meta = {
    description = "Gazebo Tools: Entrypoint to Gazebo's command line interface";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-tools";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

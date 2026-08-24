{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  cmake,

  # buildInputs

  # propagatedBuildInputs

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-lyrical-agimus-libfranka-common";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-libfranka-common";
    rev = "547a2a6f7882e1f118fd36714a7c7c1bb55aa05c";
    hash = "sha256-9x0i+z5g1DU2PJRXLEO1NW/X0fclhU0tAG5ku9hk6+Q=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "cmake";

  nativeBuildInputs = [
    cmake
  ];
  buildInputs = [
    cmake
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "fork of libfranka-common for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-libfranka-common";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

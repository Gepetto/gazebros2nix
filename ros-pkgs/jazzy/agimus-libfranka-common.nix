{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  cmake,

# buildInputs

# propagatedBuildInputs

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-libfranka-common";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-libfranka-common";
    rev = "4e881232c87d88a5276ac9ff7de177b0eff6ccd9";
    hash = "sha256-cGik6fsONgzcjQNh/xqEEsc4dXzXTNGfJ76n7wtolRc=";
  };
  sourceRoot = "source/";

  buildType = "cmake";

  nativeBuildInputs = [
    cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
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

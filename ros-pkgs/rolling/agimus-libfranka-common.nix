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
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-libfranka-common";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-libfranka-common";
    rev = "8f5f4ff8f391a0299d3098d8ade630a7e4a3a696";
    hash = "sha256-DWGr+IBerTuQt3Jv2EL4MV+gHYp+lNvPRh0tIoZZB+o=";
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

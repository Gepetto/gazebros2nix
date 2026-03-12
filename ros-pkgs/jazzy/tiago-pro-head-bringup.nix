{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  play-motion2,
  play-motion2-cli,
  tiago-pro-head-controller-configuration,
  tiago-pro-head-description,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-pro-head-bringup";
  version = "1.9.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "tiago_pro_head_robot";
    rev = "5db7298353d3c8932966c2ee5f45c475dfee1a93";
    hash = "sha256-L0nTo/kDG3zsj0TWNXNGGDmtU2BYJtEzSchEwJEYotY=";
  };
  sourceRoot = "source/tiago_pro_head_bringup";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    play-motion2
    play-motion2-cli
    tiago-pro-head-controller-configuration
    tiago-pro-head-description
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "The tiago_pro_head_bringup package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/tiago_pro_head_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

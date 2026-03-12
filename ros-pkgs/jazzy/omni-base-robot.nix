{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  omni-base-bringup,
  omni-base-controller-configuration,
  omni-base-description,

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-omni-base-robot";
  version = "2.15.1";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "omni_base_robot";
    rev = "a1033f17eafdba94462842689948860112dcb0a5";
    hash = "sha256-hlwsPp/8YDsVjUroz6NUjTKhtFSLdzp06UcdYQ6Nz1g=";
  };
  sourceRoot = "source/omni_base_robot";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    omni-base-bringup
    omni-base-controller-configuration
    omni-base-description
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The omni_base_robot package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/omni_base_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

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
  version = "2.0.19";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "omni_base_robot";
    rev = "5a822f81fe06bd400c82533f728984c35ac163e2";
    hash = "sha256-B9x54Z2vDolwrUSJenn9Ep5qrpZsdLd49Q1Qeo2Wi9k=";
  };
  sourceRoot = "source/omni_base_robot";

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
    homepage = "https://github.com/Tiago-Harmonic/omni_base_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

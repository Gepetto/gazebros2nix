{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  pmb2-bringup,
  pmb2-controller-configuration,
  pmb2-description,

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-pmb2-robot";
  version = "5.0.26";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pmb2_robot";
    rev = "984ac253d667ef0757348eaefcbb4404d599e575";
    hash = "sha256-Wonz2lRRb09m2G4IInkAepTH9zvUyJQY0nC8WLtDUdk=";
  };
  sourceRoot = "source/pmb2_robot";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    pmb2-bringup
    pmb2-controller-configuration
    pmb2-description
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "PMB2 robot description and launch files";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pmb2_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

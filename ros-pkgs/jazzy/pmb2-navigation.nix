{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  pmb2-2dnav,
  pmb2-laser-sensors,

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-pmb2-navigation";
  version = "4.5.0";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pmb2_navigation";
    rev = "4e15ad3bcc6d0df4df752ee8837bfec949c25e46";
    hash = "sha256-ZxwVosoaWIHL4+DRv80IBY53BXV6RuO6KKmysHIlNuU=";
  };
  sourceRoot = "source/pmb2_navigation";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    pmb2-2dnav
    pmb2-laser-sensors
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "PMB2 navigation metapackage";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pmb2_navigation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

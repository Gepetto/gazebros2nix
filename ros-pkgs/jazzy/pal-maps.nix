{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-maps";
  version = "0.0.5";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pal_maps";
    rev = "22ee0bf384a218420e6e2a571b7d0d7ef6cf65fc";
    hash = "sha256-JIjRXJkOZzvwuBCA0ae0mVclPuUrNKPyxFt0cHReyQk=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Public Maps used for the Navigation of PAL Robotics robots.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pal_maps";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

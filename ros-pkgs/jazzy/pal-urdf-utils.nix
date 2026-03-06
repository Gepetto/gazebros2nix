{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  xacro,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-urdf-utils";
  version = "2.5.4";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "pal_urdf_utils";
    rev = "5d15b45a4e341eb6b2b5250cbe0f8c6aa14dc31a";
    hash = "sha256-s3CXg+eM4y+iyw0Il+b4vaCZXWQlmli2EML7zdKW05g=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    xacro
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "This package contains the color materials of common elements of PAL Robotics' robot.
      The files in this package are parsed and used by
      a variety of other components.  Most users will not interact directly
      with this package.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/pal_urdf_utils";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

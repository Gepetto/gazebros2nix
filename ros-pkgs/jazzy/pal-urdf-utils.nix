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

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-urdf-utils";
  version = "2.5.4";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "pal_urdf_utils";
    rev = "dc3d28df80d8b343c1d2bced8e3b173458adf7ac";
    hash = "sha256-B085HfxFVQ1XHOmV9hIru/F9DrUc5M/1NibPDhO3uCE=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    ament-cmake-auto
  ];
  propagatedBuildInputs = [
    xacro
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];
  nativeCheckInputs = [
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

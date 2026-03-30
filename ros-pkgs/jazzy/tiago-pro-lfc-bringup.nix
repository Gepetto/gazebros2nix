{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs

  # propagatedBuildInputs

  # checkInputs
  ament-copyright,
  ament-flake8,
  ament-pep257,
  python3Packages,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-pro-lfc-bringup";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "gep_tiago_pro_control_stack";
    rev = "29b10a5ad7319d0bc8434743b53e03a58c79aa7c";
    hash = "sha256-QhDoJUtSkn5uRYl6vbCkBn5etUZnkph6GowHWPIPk0k=";
  };
  sourceRoot = "source/tiago_pro_lfc_bringup";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-copyright
    ament-flake8
    ament-pep257
    python3Packages.pytest
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Starting Linear Feedback Controllers for Tiago-pro";
    license = with lib.licenses; [ unfree ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/gep_tiago_pro_control_stack";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

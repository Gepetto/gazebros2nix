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
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-pro-lfc-bringup";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "gep_tiago_pro_control_stack";
    rev = "f590708d89acd27a468c3e84e3bcdc8f9b11708c";
    hash = "sha256-R7t34wF/0euxxcCmUO2m+CpL5fR7hNHX5Y7YtIpWxTw=";
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
    writableTmpDirAsHomeHook
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

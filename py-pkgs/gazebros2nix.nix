{
  lib,
  buildPythonPackage,
  pythonVersion,

  # build-system
  hatchling,
  # uv-build,

  # dependencies
  case-converter,
  catkin-pkg,
  jinja2,
  pygithub,
  pyyaml,
}:
buildPythonPackage {
  pname = "gazebros2nix";
  version = pythonVersion ../pyproject.toml;
  pyproject = true;

  src = lib.fileset.toSource {
    root = ../.;
    fileset = lib.fileset.unions [
      ../pyproject.toml
      ../src
      ../README.md
    ];
  };

  build-system = [
    hatchling
    # uv-build
  ];

  dependencies = [
    case-converter
    catkin-pkg
    jinja2
    pygithub
    pyyaml
  ];

  meta = {
    homepage = "https://github.com/gepetto/gazebros2nix";
    license = lib.licenses.bsd2;
    maintainers = [ lib.maintainers.nim65s ];
    platforms = lib.platforms.unix;
  };
}

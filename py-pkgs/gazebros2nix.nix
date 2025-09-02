{
  lib,
  buildPythonPackage,

  # build-system
  hatchling,
  # uv-build,

  # dependencies
  case-converter,
  catkin-pkg,
  jinja2,
  PyGithub,
  pyyaml,
}:
buildPythonPackage {
  pname = "gazebros2nix";
  version = lib.pythonVersion ../pyproject.toml;
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
    PyGithub
    pyyaml
  ];

  meta = {
    homepage = "https://github.com/gepetto/gazebros2nix";
    license = lib.licenses.bsd2;
    maintainers = [ lib.maintainers.nim65s ];
    platforms = lib.platforms.unix;
  };
}

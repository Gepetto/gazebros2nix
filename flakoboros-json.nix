{
  lib,

  pkgs,
  rosdistro,

  runCommandWith,
  writeTextFile,
  yq,
}:
let
  filenames = [
    # only those contain nixos stuff
    "base"
    "python"
    "ruby"
  ];
  rosdep = lib.map (
    filename:
    runCommandWith
      {
        name = "rosdep-${filename}.json";
        derivationArgs.nativeBuildInputs = [ yq ];
      }
      ''
        yq 'with_entries(
          select(.value.nixos) | .value = .value.nixos | select(.value | type == "array")
        )' ${rosdistro}/rosdep/${filename}.yaml > $out
      ''
  ) filenames;
in

writeTextFile {
  name = "packages-list.json";
  text = lib.toJSON {
    pkgs = lib.attrNames pkgs;
    python = lib.attrNames pkgs.python3Packages;
    ros = lib.unique (
      lib.concatMap (distro: lib.attrNames pkgs.rosPackages.${distro}) [
        "humble"
        "jazzy"
        "kilted"
        "rolling"
      ]
    );
    rosdep = lib.mergeAttrsList (lib.map (f: lib.importJSON f) rosdep);
  };
}

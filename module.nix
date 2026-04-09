{
  flakoboros,
  treefmt-nix,
  ...
}:
{
  lib,
  self,
  ...
}:
{
  imports = [
    treefmt-nix.flakeModule
    flakoboros.flakeModule
  ];

  config = {
    flake.overlays.gazebros2nix = lib.composeManyExtensions [
      (import ./garbage)
      (import ./generated.nix)
      (import ./todo.nix)
    ];

    flakoboros = {
      nixpkgsConfig = {
        allowUnfree = true;
        permittedInsecurePackages = [
          # SHAME
          "freeimage-3.18.0-unstable-2024-04-18"
        ];
      };
      overlays = [ self.overlays.gazebros2nix ];
    };

    perSystem =
      {
        pkgs,
        ...
      }:
      {
        treefmt = {
          # workaround  https://github.com/numtide/treefmt-nix/issues/352
          inherit pkgs;
          programs = {
            deadnix.enable = true;
            keep-sorted.enable = true;
            nixfmt.enable = true;
          };
        };
      };
  };
}

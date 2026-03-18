final: prev: {
  freeimage = final.callPackage ./freeimage/package.nix { };
  libjpeg_turbo-freeimage = final.callPackage ./libjpeg_turbo-freeimage/package.nix { };
}

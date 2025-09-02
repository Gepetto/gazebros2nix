{ python3Packages }:

(python3Packages.toPythonApplication python3Packages.gazebros2nix).overrideAttrs (super: {
  meta = super.meta // {
    mainProgram = "ros2nix";
  };
})

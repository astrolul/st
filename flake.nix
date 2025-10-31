{
  description = "Custom build of st";  # e.g., "Custom build of st"

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";  # Match your NixOS version
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";  # Adjust if needed for your arch
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.st.overrideAttrs (oldAttrs: {
      src = self;  # Use the repo itself as the source
      patches = [ ];  # Add any custom patches here if needed
      # Add any other overrides, e.g., buildInputs if required
    });
  };
}

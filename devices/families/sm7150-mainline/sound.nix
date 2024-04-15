{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      sm7150-alsa-ucm = self.callPackage (
        { runCommand, fetchFromGitHub }:

        runCommand "sm7150-alsa-ucm" {
          src = fetchFromGitHub {
            name = "sm7150-alsa-ucm";
            owner = "sm7150-mainline";
            repo = "alsa-ucm-conf";
            rev = "22c059d9caabcc7a434943827eafdd4d99a287e0"; # master
            sha256 = "sha256-2tXQ5NV3gtnSjeP9f5YFpVrQ3U1Rs8YLXePHA6gPbX4=";
          };
        } ''
          mkdir -p $out/share/
          ln -s $src $out/share/alsa
        ''
      ) {};
    })
  ];

  # Alsa UCM profiles
  mobile.quirks.audio.alsa-ucm-meld = true;
  environment.systemPackages = [
    pkgs.sm7150-alsa-ucm
  ];
}

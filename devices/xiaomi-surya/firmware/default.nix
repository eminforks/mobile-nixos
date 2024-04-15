{ lib
, fetchFromGitHub
, runCommand
}:

let
  baseFw = fetchFromGitHub {
    owner = "sm7150-mainline";
    repo = "firmware-xiaomi-surya";
    rev = "50b79d443b36253d48e251366a503d2f86f1b5fc";
    sha256 = "sha256-emFArgNpF70xoQabWjB23TliVHS+nPwKs7bnXIW24kA=";
  };
in runCommand "xiaomi-surya-firmware" {
  inherit baseFw;
  # We make no claims that it can be redistributed.
  meta.license = lib.licenses.unfree;
} ''
  mkdir -p $out/lib/firmware
  cp -r $baseFw/lib/firmware/* $out/lib/firmware/
  chmod +w -R $out
''

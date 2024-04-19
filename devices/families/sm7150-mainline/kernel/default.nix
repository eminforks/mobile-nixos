{ mobile-nixos
, fetchFromGitHub
, fetchpatch
, ...
}:

mobile-nixos.kernel-builder {
  version = "6.8.3";
  configfile = ./config.aarch64;

  src = fetchFromGitHub {
    owner = "sm7150-mainline";
    repo = "linux";
    rev = "db7bc51ca7170144f419674f540c6410d465271c";
    hash = "sha256-MIbHANlmql7/EM4SkjA8369h/1t73/vDr8BerlKGrJE=";
  };

  isModular = false;
  isCompressed = "gz";
}

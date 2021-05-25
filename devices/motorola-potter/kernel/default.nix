{
  mobile-nixos
, stdenv
, fetchFromGitHub
, ...
}:

#
# Note:
# This kernel build is special, it supports both armv7l and aarch64.
# This is because motorola ships an armv7l userspace from stock ROM.
#
# in local.nix:
#  mobile.system.system = lib.mkForce "armv7l-linux";
#

mobile-nixos.kernel-builder-gcc6 {
  version = "3.18.113";
  configfile = ./. + "/config.${stdenv.hostPlatform.parsed.cpu.name}";

  src = fetchFromGitHub {
    owner = "boulzordev";
    repo = "android_kernel_motorola_msm8953";
    rev = "efeb95ed634079eb520922f6f78f16f9d967a6d4";
    sha256 = "03xmlyq06fvn0v4nvrs2nhmb88axg45ccd1vb3nam6jj1381zv4w";
  };

  patches = [
    ./04_fix_camera_msm_isp.patch
    # these two don't apply to boulzordev kernel, and I am
    # hoping/assuming are not needed
    #    ./05_misc_msm_fixes.patch
    #    ./06_prima_gcc6.patch
    ./99_framebuffer.patch
    ./0001-Allow-building-WCD9335_CODEC-without-REGMAP_ALLOW_WR.patch
    ./0005-Allow-building-with-sound-disabled.patch
  ];

  enableRemovingWerror = true;
  isModular = false;
  isQcdt = true;
}

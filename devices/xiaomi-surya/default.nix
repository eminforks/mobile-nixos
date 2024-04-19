{ config, lib, pkgs, ... }:

{
  imports = [
    ../families/sm7150-mainline
  ];

  mobile.device.name = "xiaomi-surya";
  mobile.device.identity = {
    name = "POCO X3 NFC";
    manufacturer = "Xiaomi";
  };
  mobile.device.supportLevel = "supported";

  mobile.hardware = {
    ram = 1024 * 6;
    screen = {
      width = 1080; height = 2400;
    };
  };

  mobile.device.firmware = pkgs.callPackage ./firmware {};

  mobile.system.android.device_name = "surya";
}

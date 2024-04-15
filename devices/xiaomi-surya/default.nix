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

  mobile.boot.stage-1.kernel = {
    modules = [
      # These are modules because postmarketos builds them as
      # modules.  Excepting that you only need one of the two
      # panel modules (hardware-dependent) it might make more
      # sense to build them monolithically. Unless you want to
      # run your phone headlessly ...
      "nt36xxx-spi"
      "panel_huaxing_nt36672c"
      "panel_tianma_nt36672c"
      "qcom_wled"
    ];
  };

  mobile.hardware = {
    ram = 1024 * 6;
    screen = {
      width = 1080; height = 2400;
    };
  };

  mobile.device.firmware = pkgs.callPackage ./firmware {};

  mobile.system.android.device_name = "surya";
}

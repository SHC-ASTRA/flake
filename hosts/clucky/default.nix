{ config, ... }: {
  boot.extraModulePackages = [
    config.boot.kernelPackages.rtl88xxau-aircrack
  ];
}

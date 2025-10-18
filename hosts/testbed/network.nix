{ pkgs, hosts, ... }:
{
  environment.systemPackages = [
    pkgs.hostapd
  ];
  
  services = {
    hostapd = {
      enable = true;
      radios.wlp0s20fu6u4.networks.wlp0s20fu6u4 = {
        ssid = "testbed";
        apIsolate = false;
        authentication = {
          wpaPassword = "opticslabisclosed";
          mode = "wpa2-sha256";
        };
      };
    };
  };
}

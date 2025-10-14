{ pkgs, hosts, ... }:
{
  environment.systemPackages = [
    pkgs.hostapd
  ];
  networking.interfaces.wlp4s0f3u1u4 = {
    ipv4.addresses = [{
      address = hosts.deck.ip;
      prefixLength = 24;
    }];
  };
  services = {
    hostapd = {
      enable = true;
      radios.wlp4s0f3u1u4.networks.wlp4s0f3u1u4 = {
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

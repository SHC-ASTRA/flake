{ ... }:
{
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  networking.interfaces.sixseven.macAddress = "74:FE:CE:35:29:38";
  services.openssh = {
    enable = true;
    settings = {
      UseDns = true;
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };
}

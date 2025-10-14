{ ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      UseDns = true;
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };
}

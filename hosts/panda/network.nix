{ hosts, ... }:
{
  networking.interfaces."enp1s0" = {
    ipv4.addresses = [
      {
        address = hosts.panda.ip;
        prefixLength = 24;
      }
    ];
  };
}

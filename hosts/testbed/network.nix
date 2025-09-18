{ ... }:
{
  netowrking.interfaces."enp1s0" = {
    ipv4.addresses = [
      {
        address = "192.168.1.32";
        prefixLength = 24;
      }
    ];
  };
}

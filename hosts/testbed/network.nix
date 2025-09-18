{ hosts, ... }:
{
  netowrking.interfaces."enp1s0" = {
    ipv4.addresses = [
      {
        address = hosts.testbed.ip;
        prefixLength = 24;
      }
    ];
  };
}

{ ... }:
{
  networking.interfaces."enp4s0f3u1u2" = {
    ipv4.addresses = [
      {
        address = "192.168.1.31";
        prefixLength = 24;
      }
    ];
  };
}

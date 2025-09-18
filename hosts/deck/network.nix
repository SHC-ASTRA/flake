{ hosts, ... }:
{
  networking.interfaces."enp4s0f3u1u2" = {
    ipv4.addresses = [
      {
        address = hosts.deck.ip;
        prefixLength = 24;
      }
    ];
  };
}

{ hosts, ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    forwardAgent = true;
    extraConfig = ''
      PreferredAuthentications publickey,password
      IdentitiesOnly true
      IdentityFile ~/.ssh/id_ed25519
    '';
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github";
        identitiesOnly = true;
      };

      "clucky" = {
        hostname = hosts.clucky.ip;
        user = "astra";
      };
      "testbed" = {
        hostname = hosts.testbed.ip;
        user = "astra";
      };
      "deck" = {
        hostname = hosts.deck.ip;
        user = "astra";
      };
      "panda" = {
        hostname = hosts.panda.ip;
        user = "astra";
      };
      "antenna" = {
        hostname = hosts.antenna.ip;
        user = "astra";
      };
    };
  };
}

{ ... }:
{
  programs = {
    git = {
      enable = true;
      delta.enable = true;
      extraConfig = {
        user = {
         email = "90978381+ASTRA-SHC@users.noreply.github.com";
         name = "SHC-ASTRA";
        };
      };
    };
  };
}

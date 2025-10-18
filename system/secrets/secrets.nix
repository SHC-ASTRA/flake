let
  users = import ./authorized_keys.nix;

  systems = [ ];
in
{
  "id_ed25519-key.age".publicKeys = users ++ systems;
}

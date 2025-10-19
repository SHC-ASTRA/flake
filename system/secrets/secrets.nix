let
  users = import ./authorized_keys.nix;

  testbed = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPk+0RwYnmHx5jl/b+/jqiGO5l4tNNtPTElXpYsmVbnl root@testbed";

  systems = [ testbed ];
in
{
  "id_ed25519-key.age".publicKeys = users ++ systems;
}

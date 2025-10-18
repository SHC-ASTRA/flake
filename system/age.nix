{ ... }:
{
  age.secrets = {
    id_ed25519-key = {
      file = ./secrets/id_ed25519-key.age;
      path = "/home/astra/.ssh/id_ed25519";
      mode = "600";
      owner = "astra";
      group = "users";
    };
  };
}

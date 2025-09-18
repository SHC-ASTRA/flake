{ ... }: {
  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  networking = {
    # Firewall needs to be disabled
    firewall.enable = false;
    # Enable networking
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  environment = { sessionVariables = { EDITOR = "nvim"; }; };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "astra" ];
      auto-optimise-store = true;
    };
  };

  users.users.astra = {
    isNormalUser = true;
    description = "ASTRA";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs = { dconf.enable = true; };

  virtualisation.docker.enable = true;

  services = {
    ros2 = {
      enable = true;
      distro = "humble";

      systemPackages = p:
        with p; [
          ros-core
          ros2cli
          ros2run
          ament-cmake-core
          python-cmake-module
        ];
    };

    # Enable sound with pipewire.
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

  };

  security.rtkit.enable = true;

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  system.stateVersion = "25.05";
}

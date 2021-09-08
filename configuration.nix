{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "<change_here>"; 
  networking.networkmanager.enable = true;
  
  time.timeZone = "Europe/Istanbul";

  networking.useDHCP = false;
  networking.interfaces.<change_here>.useDHCP = true;
  i18n.defaultLocale = "tr_TR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "trq";
  };

  services.xserver.enable = true; 

  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true; 

  services.xserver.layout = "tr";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.libinput.enable = true;

  users.users.<change_here> = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
   };

   environment.systemPackages = with pkgs; [
     vim 
     wget
     firefox
     geany
     pcmanfm
     git
     pkgs.jdk11
     tilix
     arc-theme
     papirus-icon-theme
     pkgs.gnome.gnome-tweaks
   ];

  system.stateVersion = "21.05"; 

}


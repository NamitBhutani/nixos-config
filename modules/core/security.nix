{ ... }:
{
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.hyprlock.enableGnomeKeyring = true;
  security.polkit.enable = true;
}

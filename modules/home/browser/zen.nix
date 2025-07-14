{
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    #inputs.zen-browser.homeModules.beta
    inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
    policies = {
      #DisableAppUpdate = true;
      DisableTelemetry = true;
      # find more options here: https://mozilla.github.io/policy-templates/
    };
  };

  #deploy catppuccin files to all zen profiles
  home.activation.copyToAllZenProfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    FILES_DIR="$HOME/.config/nixos-config/modules/home/browser/catppuccin"
    PROFILES_DIR="$HOME/.zen"
    for profile in "$PROFILES_DIR"/*; do
      if [ -d "$profile" ]; then
        CHROME_DIR="$profile/chrome"
        mkdir -p "$CHROME_DIR"
        cp "$FILES_DIR"/* "$CHROME_DIR/"
      fi
    done
  '';

}

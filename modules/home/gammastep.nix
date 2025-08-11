{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 17.4;
    longitude = 78.5;

    dawnTime = "06:00";
    duskTime = "20:00";

    temperature = {
      day = 6500;
      night = 3500;
    };

    tray = true;

    settings = {
      general = {
        adjustment-method = "wayland";
        gamma = 1.1;
        brightness-day = 1.0;
        brightness-night = 1.0;
        fade = 1;
        transition = 1;
      };
    };
  };
}

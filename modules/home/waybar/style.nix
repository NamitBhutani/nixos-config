{ ... }:
let
  custom = {
    font = "JetBrainsMono Nerd Font";
    font_size = "15px";
    font_weight = "bold";
    text_color = "#cdd6f4";
    secondary_accent = "89b4fa";
    tertiary_accent = "f5f5f5";
    background = "11111B";
    opacity = "0.98";
  };
in
{
  programs.waybar.style = ''

    * {
        border: none;
        border-radius: 0px;
        padding: 0;
        margin: 0;
        min-height: 0px;
        font-family: ${custom.font};
        font-weight: ${custom.font_weight};
        opacity: ${custom.opacity};
    }

    window#waybar {
        background: none;
    }

    #workspaces {
        font-size: 18px;
        padding-left: 15px;
        
    }
    #workspaces button {
        color: ${custom.text_color};
        padding-left:  6px;
        padding-right: 6px;
    }
    #workspaces button.empty {
        color: #6c7086;
    }
    #workspaces button.active {
        color: #b4befe;
    }

    #tray, #pulseaudio, #network, #cpu, #memory, #disk, #clock, #battery, #backlight {
        font-size: ${custom.font_size};
        color: ${custom.text_color};
    }

    #cpu {
        padding-left: 15px;
        padding-right: 6px;
        margin-left: 6px;
    }
    #memory {
        padding-left: 6px;
        padding-right: 6px;
    }
    #disk {
        padding-left: 6px;
        padding-right: 15px;
    }

    #tray {
        padding: 0 20px;
        margin-left: 6px;
    }
    #backlight {
        padding-left: 15px;
        padding-right: 6px;
    }

    #pulseaudio {
        padding-left: 6px;
        padding-right: 6px;
    }
    #battery {
        padding-left: 6px;
        padding-right: 6px;
    }
    #network {
        padding-left: 6px;
        padding-right: 15px;
    }

    #clock {
        padding-left: 6px;
        padding-right: 15px;
    }

    #custom-launcher {
        font-size: 20px;
        color: #b4befe;
        font-weight: ${custom.font_weight};
        padding-left: 10px;
        padding-right: 15px;
    }

    #temperature {
    color: ${custom.text_color};
        padding-left: 25px;
        padding-right: 15px;
    }
  '';
}

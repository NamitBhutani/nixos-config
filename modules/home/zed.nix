{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "toml"
      "glsl"
      "basher"
      "make"
    ];

    extraPackages = with pkgs; [
      nixd
      clang-tools
      shellcheck
    ];

    userSettings = {
      vim_mode = false;
      load_direnv = "shell_hook";

      ui_font_size = 16;
      buffer_font_size = 16;
      show_whitespaces = "trailing";

      terminal = {
        dock = "bottom";
        blinking = "off";
        copy_on_select = false;

        shell = {
          program = "${pkgs.fish}/bin/fish";
        };

        detect_venv = {
          on = {
            directories = [
              ".venv"
              "venv"
              ".env"
            ];
            activate_script = "default";
          };
        };
        line_height = "comfortable";
        working_directory = "current_project_directory";
      };

      lsp = {
        clangd = {
          binary = {
            path_lookup = true;
          };
        };
        nixd = {
          binary = {
            path_lookup = true;
          };
        };
      };

      languages = {
        "Nix" = {
          language_servers = [
            "nixd"
            "!nil"
          ];
        };
      };

      hour_format = "hour24";
      auto_update = false;
    };
  };
}

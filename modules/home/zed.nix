{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;

    # Essential extensions for your workflow
    extensions = [
      "nix" # Nix language support
      "toml" # Configuration files
      "glsl" # Shader programming
      "basher" # Shell scripting
      "make" # Build systems
    ];

    # Add LSP servers to the FHS environment
    extraPackages = with pkgs; [
      nixd # Nix LSP
      clang-tools # C/C++ LSP (clangd)
      shellcheck # Shell script linting
    ];

    userSettings = {
      # Vim mode (recommended for your workflow)
      vim_mode = false;

      # Performance: use direnv for per-project environments
      load_direnv = "shell_hook";

      # Display settings
      ui_font_size = 16;
      buffer_font_size = 16;
      show_whitespaces = "trailing";

      # Terminal configuration
      terminal = {
        dock = "bottom";
        blinking = "off";
        copy_on_select = false;
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

      # LSP configuration - use system binaries
      lsp = {
        clangd = {
          binary = {
            path_lookup = true;
          };
        };
        nix = {
          binary = {
            path_lookup = true;
          };
        };
      };

      hour_format = "hour24";
      auto_update = false; # Managed by Nix
    };
  };
}

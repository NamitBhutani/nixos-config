local wezterm = require 'wezterm'

return {
    hide_tab_bar_if_only_one_tab = true,
    --enable_wayland = false,
    tab_bar_at_bottom = true,
    font = wezterm.font('JetBrainsMono Nerd Font'),
    enable_kitty_keyboard = true,
    color_scheme = "Catppuccin Mocha",
    window_padding = {
        left = 20,
        right = 5,
        top = 5,
        bottom = 5,
    },
}
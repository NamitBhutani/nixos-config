local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")

config.default_prog = { "tmux", "new-session", "-A", "-s", "main" }

-- Hide WezTerm tab bar (tmux handles it)
config.enable_tab_bar = false

config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = {
    "bash", "sh", "zsh", "fish", "tmux"
}

config.keys = {
    { key = "b", mods = "CTRL",       action = wezterm.action.SendString("\x02") },
    { key = "+", mods = "CTRL|SHIFT", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "CTRL",       action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "CTRL",       action = wezterm.action.ResetFontSize },
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
}

return config

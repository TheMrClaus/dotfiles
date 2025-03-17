-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Use Dracula (Official) colorscheme
config.color_scheme = "Dracula (Official)"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

config.enable_tab_bar = true -- Needed for tab settings below
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 10

-- and finally, return the configuration to wezterm
return config


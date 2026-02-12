local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_wayland = false

-- Font Settings
config.font = wezterm.font_with_fallback({
    'FiraCode Nerd Font',
    'Symbols Nerd Font Mono',
    'Noto Color Emoji',
})
config.font_size = 12.0 -- Adjust size as needed

-- Colors
config.color_scheme = "Catppuccin Mocha" -- Mocha, Macchiato, Frappe or Latte
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
  background = "black",
}

--Appearance
config.window_decorations = "None"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.80
-- config.window_background_gradient = {preset = "Greys"}


return config

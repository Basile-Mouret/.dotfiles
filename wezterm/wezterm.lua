local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font Settings
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 12.0 -- Adjust size as needed

-- Colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}

--Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.80
-- config.window_background_gradient = {preset = "Greys"}
config.color_scheme = "Catppuccin Mocha" -- Mocha, Macchiato, Frappe or Latte
config.colors = {background = "black"}


return config

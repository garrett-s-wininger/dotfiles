local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Color and fonts
config.color_scheme = 'Darcula (base16)'
config.font = wezterm.font('JetBrains Mono', { italic = true })
config.font_size = 10

-- Window and tabs
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

return config

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { '/usr/bin/bash' }
config.initial_cols = 120
config.initial_rows = 30
config.font = wezterm.font('Moralerspace Neon HWJPDOC')
config.font_size = 14.0
config.window_background_opacity = 0.70

return config

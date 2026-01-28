-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.background = {
  {
    source = { File = '/home/bogay/Pictures/Wallpapers/103634723_p0_master1200.jpg' },
    vertical_align = "Middle",
    horizontal_align = "Center",
  },
  {
    source = { Color = 'black' },
    height = '120%',
    width = '120%',
    vertical_offset = '-10%',
    horizontal_offset = '-10%',
    opacity = 0.9,
  },
}

-- Finally, return the configuration to wezterm:
return config


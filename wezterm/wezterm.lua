-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Wezterm UI
config.tab_bar_at_bottom = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.color_scheme = 'OceanicMaterial'
-- config.color_scheme = 'Tokyo Night (Gogh)'
-- config.color_scheme = 'Molokai'
-- config.color_scheme = 'MaterialOcean'
-- config.color_scheme = 'Mariana'
-- config.color_scheme = 'Darkside'
-- config.color_scheme = 'MaterialDesignColors'
-- config.font = wezterm.font 'Cascadia Code PL'
config.font = wezterm.font {
  family = 'Cascadia Code PL',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
}
config.font_size = 13.0
config.line_height = 1.2

-- quick select pattern Ctrl+Shift+Space
config.quick_select_patterns = {
  -- match quoted strings
  "'.*'",
}

-- Key maps
config.keys = {
  -- Send text: ESC :w Enter to save in (n)vim
  {
    key = 's',
    mods = 'CMD',
    action = wezterm.action.SendString '\x1b:w\r',
  },
  -- Toggle comment with gcc in nvim
  {
    key = '/',
    mods = 'CMD',
    action = wezterm.action.SendString 'gcc\x1b',
  },
  -- Jump to line end in nvim
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.SendString '$',
  },
  -- Jump to line start in nvim
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.SendString '0',
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- map Sublime multiline selection key binding with vim-multi
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'n', mods = 'CTRL' },
  },
  -- This will create a new split to bottom
  {
    key = 'Enter',
    mods = 'SHIFT|CMD',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      -- command = { args = { 'top' } },
      size = { Percent = 30 },
    },
  },

  -- This will create a new split to the right
  {
    key = 'Enter',
    mods = 'CMD',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      -- command = { args = { 'top' } },
      size = { Percent = 30 },
    },
  },
  -- Turn of search shortcut to reserve it for nvim. Use CMD-F instead
  {
    key = 'f',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },

}

-- and finally, return the configuration to wezterm
return config


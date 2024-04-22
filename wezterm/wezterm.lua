-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.default_cursor_style = "BlinkingBlock"
-- config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_ease_in = "Constant"

-- Wezterm UI
config.tab_bar_at_bottom = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.color_scheme = "OceanicMaterial"
-- config.color_scheme = "Tokyo Night (Gogh)"
-- config.color_scheme = "Molokai"
-- config.color_scheme = 'MaterialOcean'
-- config.color_scheme = 'Mariana'
-- config.color_scheme = 'Darkside'
-- config.color_scheme = 'MaterialDesignColors'
config.colors = {
	cursor_border = "#2fb170",
	cursor_bg = "#2fb170",
}

-- config.font = wezterm.font 'Cascadia Code PL'
config.font = wezterm.font_with_fallback({
	{
		-- family = "Cascadia Code",
		-- family = "ZedMono Nerd Font",
		-- family = "Monaspace Neon Var",
		-- family = "Liberation Mono",
		-- family = "SF Mono",
		-- family = "Geist Mono",
		family = "JetBrains Mono",
		weight = "Medium",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- disable ligatures
	},
	-- {
	-- 	family = "CaskaydiaCove Nerd Font",
	-- },
	{
		family = "LiterationMono Nerd Font",
	},
})
config.font_size = 14.0
config.line_height = 1.2

-- quick select pattern Ctrl+Shift+Space
config.quick_select_patterns = {
	-- match quoted strings
	"'.*'",
	-- match within quotes
	'(?<=")[^"]*?(?=")',
	-- match arguments in command man page
	"[-][-]?[a-zA-Z0-9_-]+=?[a-zA-Z0-9_-]*",
}

-- override hyperlinks to avoid clicking on package@version
config.hyperlink_rules = {
	-- Matches: a URL in parens: (URL)
	{
		regex = "\\((\\w+://\\S+)\\)",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in brackets: [URL]
	{
		regex = "\\[(\\w+://\\S+)\\]",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in curly braces: {URL}
	{
		regex = "\\{(\\w+://\\S+)\\}",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in angle brackets: <URL>
	{
		regex = "<(\\w+://\\S+)>",
		format = "$1",
		highlight = 1,
	},
	-- Then handle URLs not wrapped in brackets
	{
		regex = "\\b\\w+://\\S+[)/a-zA-Z0-9-]+",
		format = "$0",
	},
	-- implicit mailto link
	-- {
	--   regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
	--   format = 'mailto:$0',
	-- },
}

-- Key maps
config.keys = {
	-- Send text: ESC :w Enter to save in (n)vim
	{
		key = "s",
		mods = "CMD",
		action = wezterm.action.SendString("\x1b:w\r"),
	},
	-- Toggle comment with gcc in nvim
	{
		key = "/",
		mods = "CMD",
		action = wezterm.action.SendString("gcc\x1b"),
	},
	-- Jump to line end in nvim
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action.SendString("$"),
	},
	-- Jump to line start in nvim
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action.SendString("0"),
	},
	-- Jump to firt line in nvim
	{
		key = "UpArrow",
		mods = "CMD",
		action = wezterm.action.SendString("gg"),
	},
	-- Jump to last line in nvim
	{
		key = "DownArrow",
		mods = "CMD",
		action = wezterm.action.SendString("G"),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	-- map Sublime multiline selection key binding with vim-multi
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "n", mods = "CTRL" }),
	},
	-- This will create a new split to bottom
	{
		key = "Enter",
		mods = "SHIFT|CMD",
		action = wezterm.action.SplitPane({
			direction = "Down",
			command = { domain = "CurrentPaneDomain" },
			size = { Percent = 30 },
		}),
	},

	-- This will create a new split to the right
	{
		key = "Enter",
		mods = "CMD",
		action = wezterm.action.SplitPane({
			direction = "Right",
			command = { domain = "CurrentPaneDomain" },
			size = { Percent = 40 },
		}),
	},
	-- Turn of search shortcut to reserve it for nvim. Use CMD-F instead
	{
		key = "f",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	-- Turn of command palette shortcut to reserve it for nvim. Use CMD-SHIFT-P instead
	{
		key = "p",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	-- Turn off the default Ctrl-Shirt-C Copy action for nvim
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "p",
		mods = "SHIFT|CMD",
		action = wezterm.action.ActivateCommandPalette,
	},
	{ key = "LeftArrow", mods = "SHIFT|CMD", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "SHIFT|CMD", action = wezterm.action.ActivateTabRelative(1) },
}

-- and finally, return the configuration to wezterm
return config

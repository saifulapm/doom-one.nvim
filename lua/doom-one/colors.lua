local current_bg = vim.opt.background:get()
local utils = require 'doom-one.utils'
local palette_colors = {}

if current_bg == 'light' then
  palette_colors = {
    base0 = '#f0f0f0',
    base1 = '#e7e7e7',
    base2 = '#dfdfdf',
    base3 = '#c6c7c7',
    base4 = '#9ca0a4',
    base5 = '#383a42',
    base6 = '#202328',
    base7 = '#23272e',
    base8 = '#1c1f24',
    base9 = '#1B2229',
    grey = '#9ca0a4',
    red = '#e45649',
    orange = '#da8548',
    green = '#50a14f',
    yellow = '#986801',
    blue = '#4078f2',
    dark_blue = '#a0bcf8',
    magenta = '#a626a4',
    violet = '#b751b6',
    dark_violet = '#e5c7e5',
    cyan = '#0184bc',
    white = '#efefef',
    bg = '#fafafa',
    bg_alt = '#f0f0f0',
  }
  palette_colors.light_magenta = utils.Darken(palette_colors.magenta, 0.36)
else
  palette_colors = {
    base0 = '#1B2229',
    base1 = '#1c1f24',
    base2 = '#202328',
    base3 = '#23272e',
    base4 = '#3f444a',
    base5 = '#5B6268',
    base6 = '#73797e',
    base7 = '#9ca0a4',
    base8 = '#DFDFDF',
    base9 = '#E6E6E6',
    grey = '#3f444a',
    red = '#ff6c6b',
    orange = '#da8548',
    green = '#98be65',
    yellow = '#ECBE7B',
    blue = '#51afef',
    dark_blue = '#2257A0',
    magenta = '#c678dd',
    violet = '#a9a1e1',
    dark_violet = '#4e4f67',
    cyan = '#46D9FF',
    white = '#efefef',
    bg = '#282c34',
    bg_alt = '#21242b',
    bg_highlight = '#21252a',
    bg_popup = '#3E4556',
    bg_highlighted = '#4A4A45',
    fg = '#bbc2cf',
    fg_alt = '#5B6268',
  }
  palette_colors.light_magenta = utils.Lighten(palette_colors.magenta, 0.36)
end

local M = {}

--- generate color table
-- @param config config options containing colors and theme fields (optional)
-- @return table of palette colors and theme colors merged with config.colors
function M.setup(config)
  config = vim.tbl_extend('force', require('doom-one').config, config or {})
  local colors = vim.tbl_extend('force', palette_colors, config.colors)
  local theme = require('doom-one.themes')['default'](colors)
  theme = vim.tbl_extend('force', theme, config.colors)
  return vim.tbl_extend('force', theme, colors)
end

return M

local current_bg = vim.opt.background:get()
local utils = require 'doom-one.utils'

if current_bg == 'light' then
  return {
    default = function(colors)
      return {
        bg_highlight = utils.Darken(colors.bg, 0.3),
        bg_popup = colors.bg_alt,
        bg_statusline = colors.bg_alt,
        fg = colors.base5,
        fg_alt = colors.base3,
        fg_highlight = utils.Lighten(colors.base5, 0.2),
        tag = utils.Mix(colors.blue, colors.cyan, 0.5),
        diff_info_fg = colors.orange,
        diff_info_bg0 = utils.Mix('#D8EEFD', colors.bg, 0.6),
        diff_info_bg1 = utils.Mix('#D8EEFD', colors.bg, 0.8),
        diff_add_fg = colors.green,
        diff_add_fg0 = utils.Mix(colors.green, colors.base5, 0.4),
        diff_add_bg0 = utils.Mix('#506d5b', colors.bg, 0.4),
        diff_add_bg1 = utils.Mix('#acf2bd', colors.bg, 0.8),
        ng_add_fg = '#40803f',
        ng_add_fg_hl = colors.green,
        ng_add_bg = '#e9f1e8',
        ng_add_bg_hl = '#d8e8d7',
        ng_delete_fg = '#cc5655',
        ng_delete_fg_hl = colors.red,
        ng_delete_bg = '#f7e9e8',
        ng_delete_bg_hl = '#f5d9d6',
        ng_header_bg = colors.dark_violet,
        ng_header_bg_hl = colors.violet,
        gh_danger_fg = colors.red,
        gh_danger_fg0 = utils.Mix(colors.red, colors.base5, 0.6),
        gh_danger_bg0 = utils.Mix('#ffdce0', colors.bg, 0.8),
        gh_danger_bg1 = utils.Mix('#ffdce0', colors.bg, 0.9),
      }
    end,
  }
else
  return {
    default = function(colors)
      return {
        bg_statusline = colors.bg_popup,
        fg_highlight = utils.Lighten(colors.fg, 0.2),
        tag = utils.Mix(colors.blue, colors.cyan, 0.5),
        diff_info_fg = colors.orange,
        diff_info_bg0 = utils.Mix('#D8EEFD', colors.bg, 0.6),
        diff_info_bg1 = utils.Mix('#D8EEFD', colors.bg, 0.8),
        diff_add_fg = colors.green,
        diff_add_fg0 = utils.Mix(colors.green, colors.fg, 0.4),
        diff_add_bg0 = utils.Mix('#506d5b', colors.bg, 0.6),
        diff_add_bg1 = utils.Mix('#acf2bd', colors.bg, 0.8),
        ng_add_fg = '#799850',
        ng_add_fg_hl = colors.green,
        ng_add_bg = '#333a38',
        ng_add_bg_hl = '#3e493d',
        ng_delete_fg = '#cc5655',
        ng_delete_fg_hl = colors.red,
        ng_delete_bg = '#392d34',
        ng_delete_bg_hl = '#3f343a',
        ng_header_bg = colors.dark_violet,
        ng_header_bg_hl = colors.violet,
        gh_danger_fg = colors.red,
        gh_danger_fg0 = utils.Mix(colors.red, colors.fg, 0.6),
        gh_danger_bg0 = utils.Mix('#ffdce0', colors.bg, 0.6),
        gh_danger_bg1 = utils.Mix('#ffdce0', colors.bg, 0.8),
      }
    end,
  }
end

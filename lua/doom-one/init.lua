local M = {}

local function set_highlights(hlgroups)
  vim.cmd('highlight Normal guibg=' .. hlgroups.Normal.bg .. ' guifg=' .. hlgroups.Normal.fg)
  hlgroups.Normal = nil
  for group, colors in pairs(hlgroups) do
    if not vim.tbl_isempty(colors) then
      vim.api.nvim_set_hl(0, group, colors)
    end
  end
end

--- default config
M.config = {
  commentStyle = { italic = true },
  transparent = false,
  terminalColors = true,
  colors = {},
  overrides = {},
}

--- update global configuration with user settings
--@param config user configuration
--@return nil
function M.setup(config)
  M.config = vim.tbl_extend('force', M.config, config or {})
end

--- load the colorscheme
function M.load()
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  vim.g.colors_name = 'doom-one'
  vim.o.termguicolors = true

  local colors = require('doom-one.colors').setup()
  local hlgroups = require('doom-one.hlgroups').setup(colors)

  set_highlights(hlgroups)
end

return M

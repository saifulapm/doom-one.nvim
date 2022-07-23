## Rewritten doom-one.nvim (Personal Use Purpose)

## Features

- Optional terminal colors
- Optional italic comments
- Optional transparent background
- Support for numerous plugins (nvim-tree, treesitter, nvim_lsp etc)

## Install

Packer
```lua
use({
    'saifulapm/doom-one.nvim',
    config = function()
      local colors = require("doom-one.colors").setup()
      -- There is no need to call setup if you are ok with the defaults.
      require('doom-one').setup({
          commentStyle = { italic = true },
          terminalColors = true,
          transparent = false,
          colors = {},
          overrides = {},
      })
      -- setup must be called before loading
      vim.cmd('colorscheme doom-one')
    end,
})
```

### Customize highlight groups and colors

You can change the colors of existing hl-groups as well as creating new ones. Supported keywords are the same for `:h nvim_set_hl` `{val}` parameter.

You can define your own colors or use the theme colors (see example below). All the palette colors can be found [here](lua/doom-one/colors.lua).

Example:

```lua
local colors = require("doom-one.colors").setup()

-- this will affect all the hl-groups where the redefined colors are used
local my_colors = {
    -- use the palette color name...
    green = '#98c379',
    grey = '#3E4556',
    -- ...or the theme name
    bg = "#272727",
    -- you can also define new colors if you want
    -- this will be accessible from require("doom-one.colors").setup()
    -- AFTER calling require("doom-one").setup(config)
    new_color = "teal"
}

local overrides = {
    -- create a new hl-group using default palette colors and/or new ones
    MyHlGroup1 = { fg = colors.waveRed, bg = "#AAAAAA", underline = true, bold = true, guisp="blue" },

    -- override existing hl-groups, the new keywords are merged with existing ones
    VertSplit  = { fg = default_colors.bg_dark, bg = "NONE" },
    TSError    = { link = "Error" },
    TSKeywordOperator = { bold = true},
    StatusLine = { fg = my_colors.new_color }
}

require('doom-one').setup({ overrides = overrides, colors = my_colors })
vim.cmd("colorscheme doom-one")
```
## Acknowledgements
- [kanagawa](https://github.com/rebelot/kanagawa.nvim)

## Related projects
- [doom-one](https://github.com/NTBBloodbath/doom-one.nvim) - Original doom-one.nvim

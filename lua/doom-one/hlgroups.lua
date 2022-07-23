local M = {}
local utils = require 'doom-one.utils'
local current_bg = vim.opt.background:get()

local function setup_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.violet
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.grey
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_11 = colors.orange
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_13 = colors.violet
  vim.g.terminal_color_14 = colors.cyan
  vim.g.terminal_color_15 = colors.white
  vim.g.terminal_color_background = colors.bg_alt
  vim.g.terminal_color_foreground = colors.fg_alt
end

--- generate highlights table
-- @param colors color (theme) color table created by require("kanagawa.colors").setup()
-- @param config config options (optional)
function M.setup(colors, config)
  config = vim.tbl_extend('force', require('doom-one').config, config or {})

  local hlgroups = {
    -- General UI
    Normal = { fg = colors.fg, bg = config.transparent and 'NONE' or colors.bg },
    NormalPopup = {
      fg = colors.fg_highlight,
      bg = config.transparent and 'NONE' or colors.bg_popup,
    },
    NormalPopover = {
      fg = colors.fg_highlight,
      bg = config.transparent and 'NONE' or colors.bg_popup,
    },
    NormalPopupPrompt = {
      fg = colors.base7,
      bg = config.transparent and 'NONE' or utils.Darken(colors.bg_popup, 0.3),
      bold = true,
    },
    NormalPopupSubtle = {
      fg = colors.base6,
      bg = config.transparent and 'NONE' or colors.bg_popup,
    },
    EndOfBuffer = { fg = colors.bg, bg = config.transparent and 'NONE' or colors.bg },

    Visual = { bg = colors.dark_blue },
    VisualBold = { bg = colors.dark_blue, bold = true },

    LineNr = { fg = colors.grey, bg = config.transparent and 'NONE' or colors.bg },
    Cursor = { bg = colors.blue },
    CursorLine = { bg = colors.bg_highlight },
    CursorLineNr = { fg = colors.fg, bg = colors.bg_highlight },
    CursorColumn = { bg = colors.bg_highlight },

    Folded = { fg = colors.base5, bg = colors.bg_highlight },
    FoldColumn = { fg = colors.fg_alt, bg = colors.bg },
    SignColumn = { bg = config.transparent and 'NONE' or colors.bg },
    ColorColumn = { bg = colors.bg_highlight },

    IndentGuide = { fg = colors.grey },
    IndentGuideEven = { fg = colors.grey },
    IndentGuideOdd = { fg = colors.grey },

    TermCursor = { fg = colors.fg, reverse = true },
    TermCursorNC = { fg = colors.fg_alt, reverse = true },
    TermNormal = { fg = colors.fg, bg = colors.bg },
    TermNormalNC = { fg = colors.fg, bg = colors.bg },

    WildMenu = { fg = colors.fg, bg = colors.dark_blue },
    Separator = { fg = colors.fg_alt },
    VertSplit = { fg = colors.grey, bg = colors.bg },
    WinSeparator = { link = "VertSplit" },
    TabLine = {
      fg = colors.base7,
      bg = colors.bg_alt,
      bold = true,
    },
    TabLineSel = { fg = colors.blue, bg = colors.bg, bold = true },
    TabLineFill = { bg = colors.base1, bold = true },

    StatusLine = { fg = colors.base8, bg = colors.base3 },
    StatusLineNC = { fg = colors.base6, bg = colors.bg_popup },
    StatusLinePart = { fg = colors.base6, bg = colors.bg_popup, bold = true },
    StatusLinePartNC = { fg = colors.base6, bg = colors.bg_popup, bold = true },

    Pmenu = { fg = colors.fg, bg = colors.bg_highlight },
    PmenuSel = { fg = colors.base0, bg = colors.blue },
    PmenuSelBold = { fg = colors.base0, bg = colors.blue, bold = true },
    PmenuSbar = { bg = colors.bg_alt },
    PmenuThumb = { bg = colors.fg },

    -- Search, Highlight. Conceal, Messages
    Search = { fg = colors.fg, bg = colors.dark_blue, bold = true },
    Substitute = { fg = colors.red, strikethrough = true, bold = true },
    IncSearch = { fg = colors.fg, bg = colors.dark_blue, bold = true },
    IncSearchCursor = { reverse = true },
    Conceal = { fg = colors.grey, bold = false, italic = false },
    SpecialKey = { fg = colors.violet, bold = true },
    NonText = { fg = colors.fg_alt, bold = true },
    MatchParen = { fg = colors.red, bold = true },
    Whitespace = { fg = colors.grey },
    Highlight = { bg = colors.bg_highlighted },
    HighlightSubtle = { bg = colors.bg_highlighted },
    LspHighlight = { bg = colors.bg_highlight, bold = true },
    Question = { fg = colors.green, bold = true },
    File = { fg = colors.fg },
    Directory = { fg = colors.violet, bold = true },
    Title = { fg = colors.violet, bold = true },
    Bold = { bold = true },
    Emphasis = { fg = colors.green, bold = true },

    -- Text levels
    TextNormal = { fg = colors.fg },
    TextInfo = { fg = colors.blue },
    TextSuccess = { fg = colors.green },
    TextWarning = { fg = colors.yellow },
    TextDebug = { fg = colors.yellow },
    TextError = { fg = colors.red },
    TextSpecial = { fg = colors.violet },
    TextMuted = { fg = colors.base7 },
    TextNormalBold = { fg = colors.fg, bold = true },
    TextInfoBold = { fg = colors.blue, bold = true },
    TextSuccessBold = { fg = colors.green, bold = true },
    TextWarningBold = { fg = colors.yellow, bold = true },
    TextDebugBold = { fg = colors.yellow, bold = true },
    TextErrorBold = { fg = colors.red, bold = true },
    TextSpecialBold = { fg = colors.violet, bold = true },
    TextMutedBold = { fg = colors.base7, bold = true },
    Msg = { link = 'TextSuccess' },
    MoreMsg = { link = 'TextInfo' },
    WarningMsg = { link = 'TextWarning' },
    Error = { link = 'TextError' },
    ErrorMsg = { link = 'TextError' },
    ModeMsg = { link = 'TextSpecial' },
    Todo = { link = 'TextWarningBold' },

    -- Main Syntax
    Tag = { fg = colors.tag, bold = true },
    Link = { fg = colors.green, underline = true },
    URL = { fg = colors.green, underline = true },
    Underlined = { fg = colors.tag, underline = true },

    Comment = vim.tbl_extend('force', { fg = colors.fg_alt }, config.commentStyle),
    CommentBold = { fg = colors.fg_alt, bold = true },
    SpecialComment = { fg = colors.base7, bold = true },

    Macro = { fg = colors.violet },
    Define = { fg = colors.violet, bold = true },
    Include = { fg = colors.violet, bold = true },
    PreProc = { fg = colors.violet, bold = true },
    PreCondit = { fg = colors.violet, bold = true },

    Label = { fg = current_bg == 'light' and colors.orange or colors.blue },
    Repeat = { fg = current_bg == 'light' and colors.orange or colors.blue },
    Keyword = { fg = current_bg == 'light' and colors.orange or colors.blue },
    Operator = { fg = current_bg == 'light' and colors.orange or colors.blue },
    Delimiter = { fg = current_bg == 'light' and colors.orange or colors.blue },
    Statement = { fg = current_bg == 'light' and colors.orange or colors.blue },
    Exception = { fg = current_bg == 'light' and colors.orange or colors.blue },
    Conditional = { fg = current_bg == 'light' and colors.orange or colors.blue },

    Variable = { fg = '#8B93E6' },
    VariableBuiltin = { fg = '#8B93E6', bold = true },
    Constant = { fg = colors.violet, bold = true },

    Number = { fg = current_bg == 'light' and colors.yellow or colors.orange },
    Float = { fg = current_bg == 'light' and colors.yellow or colors.orange },
    Boolean = { fg = current_bg == 'light' and colors.yellow or colors.orange, bold = true },
    Enum = { fg = current_bg == 'light' and colors.yellow or colors.orange },

    Character = { fg = colors.violet, bold = true },
    SpecialChar = { fg = colors.base8, bold = true },

    String = { fg = colors.green },
    StringDelimiter = { fg = colors.green },

    Special = { fg = colors.violet },
    SpecialBold = { fg = colors.violet, bold = true },

    Field = { fg = colors.violet },
    Argument = { fg = colors.light_magenta },
    Attribute = { fg = colors.light_magenta },
    Identifier = { fg = colors.light_magenta },
    Property = { fg = colors.magenta },
    Function = { fg = colors.magenta },
    FunctionBuiltin = { fg = colors.light_magenta, bold = true },
    KeywordFunction = { fg = current_bg == 'light' and colors.orange or colors.blue },
    Method = { fg = colors.violet },

    Type = { fg = colors.yellow },
    TypeBuiltin = { fg = colors.yellow, bold = true },
    StorageClass = { fg = current_bg == 'light' and colors.orange or colors.blue },
    Class = { fg = current_bg == 'light' and colors.orange or colors.blue },
    Structure = { fg = current_bg == 'light' and colors.orange or colors.blue },
    Typedef = { fg = current_bg == 'light' and colors.orange or colors.blue },

    Regexp = { fg = '#dd0093' },
    RegexpSpecial = { fg = '#a40073' },
    RegexpDelimiter = { fg = '#540063', bold = true },
    RegexpKey = { fg = '#5f0041', bold = true },

    -- Diff
    diffLine = { fg = colors.base8, bg = colors.diff_info_bg1 },
    diffSubName = { fg = colors.base8, bg = colors.diff_info_bg1 },

    DiffAdd = { bg = colors.diff_add_bg1 },
    DiffChange = { bg = colors.diff_add_bg1 },
    DiffText = { bg = colors.diff_add_bg0 },
    DiffDelete = { bg = colors.gh_danger_bg0 },

    DiffAdded = { fg = colors.diff_add_fg0, bg = colors.diff_add_bg1 },
    DiffModified = { fg = colors.fg, bg = colors.diff_info_bg0 },
    DiffRemoved = { fg = colors.gh_danger_fg0, bg = colors.gh_danger_bg1 },

    DiffAddedGutter = { fg = colors.diff_add_fg, bold = true },
    DiffModifiedGutter = { fg = colors.diff_info_fg, bold = true },
    DiffRemovedGutter = { fg = colors.gh_danger_fg, bold = true },

    DiffAddedGutterLineNr = { fg = colors.grey },
    DiffModifiedGutterLineNr = { fg = colors.grey },
    DiffRemovedGutterLineNr = { fg = colors.grey },

    -- Markdown
    markdownCode = { bg = colors.bg_highlight },
    markdownCodeBlock = { bg = colors.bg_highlight },
    markdownH1 = { bold = true },
    markdownH2 = { bold = true },
    markdownLinkText = { underline = true },

    -- netrw
    netrwClassify = { fg = colors.blue },
    netrwDir = { fg = colors.blue },
    netrwExe = { fg = colors.green },
    netrwMakefile = { fg = colors.yellow },
    netrwTreeBar = { link = 'Comment' },

    -- Gitsigns
    GitSignsAddLn = { link = 'DiffAddedGutter' },
    GitSignsAddInline = { link = 'DiffAddedGutter' },
    GitSignsAddLnInline = { link = 'DiffAddedGutter' },
    GitSignsChangeLn = { link = 'DiffModifiedGutter' },
    GitSignsDeleteInline = { link = 'DiffRemovedGutter' },
    GitSignsDeleteLn = { link = 'DiffRemovedGutter' },
    GitSignsChangeDelete = { link = 'DiffModifiedGutter' },

    -- Telescope
    TelescopeSelection = { fg = colors.yellow, bold = true },
    TelescopeSelectionCaret = { fg = current_bg == 'light' and colors.orange or colors.blue },
    TelescopeMultiSelection = { fg = colors.grey },
    TelescopeNormal = { fg = colors.fg },
    TelescopeMatching = { fg = colors.green, bold = true },
    TelescopePromptPrefix = { fg = current_bg == 'light' and colors.orange or colors.blue },
    TelescopeBorder = { fg = current_bg == 'light' and colors.orange or colors.blue },
    TelescopePromptBorder = { fg = current_bg == 'light' and colors.orange or colors.blue },
    TelescopeResultsBorder = { fg = current_bg == 'light' and colors.orange or colors.blue },
    TelescopePreviewBorder = { fg = current_bg == 'light' and colors.orange or colors.blue },
    TelescopePrompt = { link = 'TelescopeNormal' },

    -- Neogit
    NeogitDiffAdd = { fg = colors.ng_add_fg, bg = colors.ng_add_bg },
    NeogitDiffAddHighlight = { fg = colors.ng_add_fg_hl, bg = colors.ng_add_bg_hl, bold = true },
    NeogitDiffDelete = { fg = colors.ng_delete_fg, bg = colors.ng_delete_bg },
    NeogitDiffDeleteHighlight = {
      fg = colors.ng_delete_fg_hl,
      bg = colors.ng_delete_bg_hl,
      bold = true,
    },
    NeogitDiffContext = { fg = colors.fg_alt, bg = colors.bg },
    NeogitDiffContextHighlight = { fg = colors.fg, bg = colors.bg_alt },
    NeogitHunkHeader = { fg = colors.bg, bg = colors.ng_header_bg },
    NeogitHunkHeaderHighlight = { fg = colors.bg_alt, bg = colors.ng_header_bg_hl, bold = true },
    NeogitStagedChanges = { fg = colors.blue, bold = true },
    NeogitStagedChangesRegion = { bg = colors.bg_highlight },
    NeogitStashes = { fg = colors.blue, bold = true },
    NeogitUnstagedChanges = { fg = colors.blue, bold = true },
    NeogitUntrackedfiles = { fg = colors.blue, bold = true },

    -- NvimTree
    NvimTreeNormal = { bg = colors.bg_alt },
    NvimTreeFolderName = {
      fg = current_bg == 'light' and colors.base9 or colors.blue,
      bold = true,
    },
    NvimTreeRootFolder = { fg = colors.green, bold = true },
    NvimTreeEmptyFolderName = { fg = colors.fg_alt, bold = true },
    NvimTreeSymlink = { fg = colors.fg, underline = true },
    NvimTreeExecFile = { fg = colors.green, bold = true },
    NvimTreeImageFile = { fg = current_bg == 'light' and colors.orange or colors.blue },
    NvimTreeOpenedFile = { fg = colors.fg_alt },
    NvimTreeSpecialFile = { fg = colors.fg, underline = true },
    NvimTreeMarkdownFile = { fg = colors.fg, underline = true },
    NvimTreeGitDirty = { link = 'DiffModifiedGutter' },
    NvimTreeGitStaged = { link = 'DiffModifiedGutter' },
    NvimTreeGitMerge = { link = 'DiffModifiedGutter' },
    NvimTreeGitRenamed = { link = 'DiffModifiedGutter' },
    NvimTreeGitNew = { link = 'DiffAddedGutter' },
    NvimTreeGitDeleted = { link = 'DiffRemovedGutter' },
    NvimTreeIndentMarker = { link = 'IndentGuide' },
    NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },
    NvimTreeEndOfBuffer = { fg = colors.bg_alt },
    NvimTreeFolderIcon = { fg = colors.magenta },
    NvimTreeNormalNC = { bg = colors.bg_alt },
    NvimTreeGitIgnored = { fg = colors.grey },
    NvimTreeWinSeparator = { fg = colors.bg_alt, bg = colors.bg_alt, },
    NvimTreeWindowPicker = { fg = colors.red, bg = colors.bg_alt, },
    NvimTreeCursorLine = { bg = colors.base2, },

    -- WhichKey
    WhichKey = { fg = current_bg == 'light' and colors.orange or colors.blue },
    WhichKeyGroup = { fg = colors.magenta },
    WhichKeyDesc = { fg = colors.magenta },
    WhichKeySeparator = { fg = colors.base5 },
    WhichKeyFloat = { bg = colors.base2 },
    WhichKeyValue = { fg = colors.grey },

    -- indent-blankline
    IndentBlanklineChar = { fg = colors.base4, nocombine = true },
    IndentBlanklineContextChar = { fg = colors.blue, nocombine = true },
    IndentBlanklineSpaceChar = { fg = colors.base4, nocombine = true },
    IndentBlanklineSpaceCharBlankline = { fg = colors.base4, nocombine = true },

    -- Neorg
    Blue = { fg = colors.cyan },
    Yellow = { fg = colors.yellow },
    Red = { fg = colors.red },
    Green = { fg = colors.green },
    Brown = { fg = colors.orange },

    -- LSP
    ErrorMsgUnderline = { fg = colors.red, underline = true },
    WarningMsgUnderline = { fg = colors.yellow, underline = true },
    MoreMsgUnderline = { fg = colors.blue, underline = true },
    MsgUnderline = { fg = colors.green, underline = true },
    LspDiagnosticsFloatingError = { link = 'ErrorMsg' },
    LspDiagnosticsFloatingWarning = { link = 'WarningMsg' },
    LspDiagnosticsFloatingInformation = { link = 'MoreMsg' },
    LspDiagnosticsFloatingHint = { link = 'Msg' },
    LspDiagnosticsDefaultError = { link = 'ErrorMsg' },
    LspDiagnosticsDefaultWarning = { link = 'WarningMsg' },
    LspDiagnosticsDefaultInformation = { link = 'MoreMsg' },
    LspDiagnosticsDefaultHint = { link = 'Msg' },
    LspDiagnosticsVirtualTextError = { link = 'ErrorMsg' },
    LspDiagnosticsVirtualTextWarning = { link = 'WarningMsg' },
    LspDiagnosticsVirtualTextInformation = { link = 'MoreMsg' },
    LspDiagnosticsVirtualTextHint = { link = 'Msg' },
    LspDiagnosticsUnderlineError = { link = 'ErrorMsgUnderline' },
    LspDiagnosticsUnderlineWarning = { link = 'WarningMsgUnderline' },
    LspDiagnosticsUnderlineInformation = { link = 'MoreMsgUnderline' },
    LspDiagnosticsUnderlineHint = { link = 'MsgUnderline' },
    LspDiagnosticsSignError = { link = 'ErrorMsg' },
    LspDiagnosticsSignWarning = { link = 'WarningMsg' },
    LspDiagnosticsSignInformation = { link = 'MoreMsg' },
    LspDiagnosticsSignHint = { link = 'Msg' },
    DiagnosticFloatingError = { link = 'ErrorMsg' },
    DiagnosticFloatingWarn = { link = 'WarningMsg' },
    DiagnosticFloatingInfo = { link = 'MoreMsg' },
    DiagnosticFloatingHint = { link = 'Msg' },
    DiagnosticDefaultError = { link = 'ErrorMsg' },
    DiagnosticDefaultWarn = { link = 'WarningMsg' },
    DiagnosticDefaultInfo = { link = 'MoreMsg' },
    DiagnosticDefaultHint = { link = 'Msg' },
    DiagnosticUnderlineError = { link = 'ErrorMsgUnderline' },
    DiagnosticUnderlineWarn = { link = 'WarningMsgUnderline' },
    DiagnosticUnderlineInfo = { link = 'MoreMsgUnderline' },
    DiagnosticUnderlineHint = { link = 'MsgUnderline' },
    DiagnosticSignError = { link = 'ErrorMsg' },
    DiagnosticSignWarning = { link = 'WarningMsg' },
    DiagnosticSignInformation = { link = 'MoreMsg' },
    DiagnosticSignHint = { link = 'Msg' },
    DiagnosticVirtualTextError = { link = 'ErrorMsg' },
    DiagnosticVirtualTextWarn = { link = 'WarningMsg' },
    DiagnosticVirtualTextInfo = { link = 'MoreMsg' },
    DiagnosticVirtualTextHint = { link = 'TextMuted' },
    LspReferenceText = { link = 'LspHighlight' },
    LspReferenceRead = { link = 'LspHighlight' },
    LspReferenceWrite = { link = 'LspHighlight' },
    healthError = { link = 'ErrorMsg' },
    healthSuccess = { link = 'Msg' },
    healthWarning = { link = 'WarningMsg' },

    -- TreeSitter
    TSStrike = { fg = utils.Darken(colors.violet, 0.2), strikethrough = true },
    TSException = { link = 'Exception' },
    TSAnnotation = { link = 'PreProc' },
    TSAttribute = { link = 'Attribute' },
    TSConditional = { link = 'Conditional' },
    TSComment = { link = 'Comment' },
    TSConstructor = { link = 'Structure' },
    TSConstant = { link = 'Constant' },
    TSConstBuiltin = { link = 'Constant' },
    TSConstMacro = { link = 'Macro' },
    TSError = { link = 'Error' },
    TSField = { link = 'Field' },
    TSFloat = { link = 'Float' },
    TSFunction = { link = 'Function' },
    TSFuncBuiltin = { link = 'FunctionBuiltin' },
    TSFuncMacro = { link = 'Macro' },
    TSInclude = { link = 'Include' },
    TSKeyword = { link = 'Keyword' },
    TSKeywordFunction = { link = 'KeywordFunction' },
    TSLabel = { link = 'Label' },
    TSMethod = { link = 'Method' },
    TSNamespace = { link = 'Directory' },
    TSNumber = { link = 'Number' },
    TSOperator = { link = 'Operator' },
    TSParameter = { link = 'Argument' },
    TSParameterReference = { link = 'Argument' },
    TSProperty = { link = 'Property' },
    TSPunctDelimiter = { link = 'Delimiter' },
    TSPunctBracket = { link = 'Delimiter' },
    TSPunctSpecial = { link = 'Delimiter' },
    TSRepeat = { link = 'Repeat' },
    TSString = { link = 'String' },
    TSStringRegex = { link = 'StringDelimiter' },
    TSStringEscape = { link = 'StringDelimiter' },
    TSTag = { link = 'Tag' },
    TSTagDelimiter = { link = 'Delimiter' },
    TSStrong = { link = 'Bold' },
    TSURI = { link = 'URL' },
    TSWarning = { link = 'WarningMsg' },
    TSDanger = { link = 'ErrorMsg' },
    TSType = { link = 'Type' },
    TSTypeBuiltin = { link = 'TypeBuiltin' },
    TSVariable = { link = 'None' },
    TSVariableBuiltin = { link = 'VariableBuiltin' },
  }

  for hl, specs in pairs(config.overrides) do
    if hlgroups[hl] and not vim.tbl_isempty(specs) then
      hlgroups[hl].link = nil
    end
    hlgroups[hl] = vim.tbl_extend('force', hlgroups[hl] or {}, specs)
  end

  if config.terminalColors then
    setup_terminal_colors(colors)
  end

  return hlgroups
end

return M

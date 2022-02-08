local colors = {
  bg = "#0f111a",
  fg = "#ffffff",
}

local theme = {
  normal = {
    a = { bg = colors.bg, fg = colors.fg },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  inactive = {
    a = { bg = colors.bg, fg = colors.fg },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
}

local mode = {
  function()
    local mode_color = {
      NORMAL = "Green",
      ["O-PENDING"] = "Green",
      INSERT = "Yellow",
      VISUAL = "224", -- Cream-ish color
      ["V-LINE"] = "224",
      ["V-BLOCK"] = "224",
      REPLACE = "Red",
      ["V-REPLACE"] = "Red",
      SELECT = "DarkYellow",
      ["S-LINE"] = "DarkYellow",
      ["S-BLOCK"] = "DarkYellow",
      COMMAND = "Red",
      EX = "Red",
      MORE = "LightCyan",
      CONFIRM = "LightCyan",
      SHELL = "Red",
      TERMINAL = "Red",
    }

    local mode = require("lualine.utils.mode").get_mode()
    vim.api.nvim_command("hi! LualineMode ctermfg=" .. mode_color[mode])
    return mode
  end,
  color = "LualineMode",
  padding = { left = 1, right = 1 },
}

local diff = {
  "diff",
  diff_color = {
    added = { fg = "Green" },
    modified = { fg = "Yellow" },
    removed = { fg = "Red" },
  },
}

local diagnostics = {
  "diagnostics",
  symbols = { error = " ", warn = " ", info = " " },
}

local fileformat = {
  "fileformat",
  symbols = {
    unix = "LF",
    dos = "CRLF",
    mac = "LF",
  },
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { "branch", diff, diagnostics },
    lualine_c = { "filename" },
    lualine_x = { "encoding", fileformat, "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})

local packer = require("plugins")
require("nvim_utils")

vim.g.mapleader = ","

-----------------------------------------------------------
-- Opts
-----------------------------------------------------------

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.history = 500

vim.opt.compatible = false
vim.cmd("syntax on")

-- vim.cmd("filetype plugin on")
-- vim.cmd("filetype indent on")

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true

vim.opt.encoding = "utf8"

vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false

vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
-- vim.opt.expandtab = true

vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = true

-- vim.o.autowriteall = true

vim.opt.conceallevel = 2
vim.opt.concealcursor = ""

-- A smooth line for vertical splits
vim.opt.fillchars:append("vert:│")

vim.opt.spelllang = "en_us"
vim.opt.background = "dark"

-----------------------------------------------------------
-- Hightlights
-----------------------------------------------------------

vim.api.nvim_command("hi LineNr ctermfg=Yellow")
vim.api.nvim_command("hi CursorLineNr ctermfg=Blue")

vim.api.nvim_command("hi ColorColumn ctermbg=8")
vim.api.nvim_command("hi SignColumn ctermbg=None")

-- PopUp Menu
-- TODO: Find a better Background color
vim.api.nvim_command("hi Pmenu ctermbg=16 ctermfg=None")
vim.api.nvim_command("hi PmenuSel ctermbg=Blue ctermfg=232")
vim.api.nvim_command("hi PmenuSbar ctermbg=Gray ctermfg=White")

-- Diffs
vim.api.nvim_command("hi DiffAdd ctermbg=NONE ctermfg=Green")
vim.api.nvim_command("hi DiffDelete ctermbg=NONE ctermfg=Red")
vim.api.nvim_command("hi DiffChange ctermbg=NONE ctermfg=DarkMagenta")

vim.api.nvim_command("hi link diffRemoved DiffDelete")
vim.api.nvim_command("hi link diffAdded DiffAdd")
vim.api.nvim_command("hi link diffChanged DiffChange")
vim.api.nvim_command("hi diffSubname ctermfg=DarkMagenta")

-- I like it more when it's underlined red *shrug*
vim.api.nvim_command("hi SpellBad term=underline cterm=underline ctermbg=NONE ctermfg=9")

-- Make these groups less of an eyesore
vim.api.nvim_command("hi clear VertSplit")
vim.api.nvim_command("hi VertSplit term=bold ctermfg=White")

vim.api.nvim_command("hi TabLineFill cterm=NONE ctermbg=NONE")
vim.api.nvim_command("hi TabLine cterm=NONE ctermbg=NONE ctermfg=Yellow")
vim.api.nvim_command("hi TabLineSel cterm=bold ctermfg=Blue")

-----------------------------------------------------------
-- Autocmd
-----------------------------------------------------------

nvim_create_augroups({
  -- Specific tab size by filetype
  specific_tabs = {
    { "FileType", "rust,python,json", "set tabstop=4 shiftwidth=4 expandtab" },
    {
      "FileType",
      "markdown,html,xhtml,liquid,htmldjango,javascript,javascriptreact,typescript,lua,scss,sass,nim",
      "set tabstop=2 shiftwidth=2 expandtab",
    },
  },
  -- I want spell checking on those!
  spellchecking = {
    { "BufRead,BufNewFile", "*.md,COMMIT_EDITMSG", "setlocal spell" },
  },
  line = {
    { "FileType", "gitcommit", "set colorcolumn=+1" },
    { "BufRead,BufNewFile", "CHANGELOG.md", "set colorcolumn=71" },
  },
})

-----------------------------------------------------------
-- Mapping
-----------------------------------------------------------

function mode_map(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true })
end

function mode_unmap(mode, lhs, rhs)
  vim.api.nvim_del_keymap(mode, lhs)
end

function nmap(lhs, rhs)
  mode_map("n", lhs, rhs)
end

function imap(lhs, rhs)
  mode_map("i", lhs, rhs)
end

function iunmap(lhs)
  mode_unmap("i", lhs)
end

-- General bindings
for comb, cmd in
  pairs({
    ["w"] = "w",
    ["ss"] = "setlocal spell!",
    ["/"] = "noh",
    ["rs"] = "source ~/.config/nvim/init.lua",
  })
do
  nmap("<leader>" .. comb, ":" .. cmd .. "<cr>")
end

-- Disable arrow keys
for _, arrow in pairs({ "Up", "Down", "Left", "Right" }) do
  nmap("<" .. arrow .. ">", "<nop>")
end

-- Move through splits with `Ctrl`+`Vim Key`
for _, key in pairs({ "j", "k", "h", "l" }) do
  nmap("<C-" .. key .. ">", "<C-W>" .. key)
end

-- Nifty mapping to quickly correct spelling mistakes.
-- From: https://castel.dev/post/lecture-notes-1/#correcting-spelling-mistakes-on-the-fly
imap(
  "<C-l>",
  -- "The `<c-g>u` in the middle make it possible to undo the spelling correction quickly."
  "<c-g>u"
    -- Enter Normal mode
    .. "<Esc>"
    -- Move cursor to last spelling mistake
    .. "[s"
    -- Use the first suggestion
    .. "1z="
    -- Move the cursor back
    .. "`]"
    -- Enter insert mode with cursor as it was
    .. "a"
    .. "<c-g>u"
)

local telescope_builtin = require("telescope.builtin")
local ivy_theme = require("telescope.themes").get_ivy()
nvim_apply_mappings({
  -- Telescope
  ["n<C-f>"] = {
    function()
      telescope_builtin.find_files(ivy_theme)
    end,
  },
  ["n<leader>b"] = {
    function()
      telescope_builtin.buffers(ivy_theme)
    end,
  },
  ["n<leader>g"] = {
    function()
      telescope_builtin.live_grep(ivy_theme)
    end,
  },

  -- Fugitive
  ["nfg"] = {
    ":Git<cr>",
  },
}, {
  noremap = true,
})

-- Mode to toggle mapping to type spanish characters with ease

local spanish_helper = false

nvim_apply_mappings({
  ["n<A-Z>"] = {
    function()
      local doublek = ";;"
      local prefix = "'"
      local vowels = {
        -- Lowercase
        ["a"] = "á",
        ["e"] = "é",
        ["i"] = "í",
        ["o"] = "ó",
        ["u"] = "ú",
        -- Uppercase
        ["A"] = "Á",
        ["E"] = "É",
        ["I"] = "Í",
        ["O"] = "Ó",
        ["U"] = "Ú",
      }

      if spanish_helper then
        iunmap(doublek)
        for vowel, _ in pairs(vowels) do
          iunmap(prefix .. vowel)
        end

        spanish_helper = false
      else
        imap(doublek, "ñ")
        for vowel, to in pairs(vowels) do
          imap(prefix .. vowel, to)
        end

        spanish_helper = true
      end

      print("Spanish keymappings " .. (spanish_helper and "enabled" or "disabled"))
    end,
    noremap = true,
  },
})

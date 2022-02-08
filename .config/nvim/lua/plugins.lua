-- This file can be loaded by calling `lua require("plugins")` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

-- Only required if you have packer configured as `opt`
vim.cmd("packadd packer.nvim")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function()
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Utility funtions
  use("norcalli/nvim_utils")

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = "TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "c",
          "lua",
          "rust",
          "javascript",
          "markdown",
          "python",
        },
      }
    end,
  }

  use("NoahTheDuke/vim-just")

  -- Telescope
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- Status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("statusline")
    end,
  }

  -- Comment
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  -- Whitespace
  use { "McAuleyPenney/tidy.nvim", event = "BufWritePre" }

  -- Git
  use("tpope/vim-fugitive")
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    -- tag = "release" -- To use the latest release
    config = function()
      require("gitsigns").setup {
        signcolumn = true,
        numhl = true,
        keymaps = {}, -- Using it for the signs only at the moment
        watch_gitdir = {
          interval = 10000, -- Not so fast!
        },
      }
    end,
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
  }

  -- Basic Auto Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("autocompletion")
    end,
  }
end)

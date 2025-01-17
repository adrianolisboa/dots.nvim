local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  -- Manage lazy.nvim itself
  { "folke/lazy.nvim" },


  -- Colorscheme (Solarized Dark)
  {
    "ishan9299/nvim-solarized-lua",
    lazy = false, -- Load during startup
    priority = 1000, -- Ensure it loads before other plugins
    config = function()
      vim.cmd [[ colorscheme solarized ]]
    end,
  },

  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Add all required parsers here
        ensure_installed = { "lua", "python", "javascript", "elixir", "eex", "heex" },

        -- Enable syntax highlighting
        highlight = {
          enable = true, -- Enable Treesitter-based highlighting
          additional_vim_regex_highlighting = false, -- Disable legacy Vim regex highlighting
        },

        -- Enable Treesitter-based indentation for supported languages
        indent = {
          enable = true,
        },
      })
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp")
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugins.nvim-tree")
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      default = true, -- Enable default icons
    },
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = { theme = "auto" },
      })
    end,
  },
})

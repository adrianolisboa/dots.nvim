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
    "Tsuzat/NeoSolarized.nvim",
      lazy = false, -- make sure we load this during startup
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        vim.cmd [[ colorscheme NeoSolarized ]]
      end
  },

  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript" },
        highlight = { enable = true },
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

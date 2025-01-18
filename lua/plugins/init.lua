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

  ------ UI Plugins ------
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

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugins.specs.nvim-tree")
    end,
  },

  -- Icons for file explorer
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      default = true, -- Enable default icons
    },
  },

  {
    "echasnovski/mini.icons",
    version = false,
    config = function()
      require("mini.icons").setup()
    end,
  },

  -- Telescope for fuzzy finding
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Required dependency
    config = function()
      require('telescope').setup()
    end,
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

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.specs.bufferline")
    end,
  },

  -- Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    version = "v3.*",
    config = function()
      require("plugins.specs.indent_blankline")
    end,
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    config = function()
      require("plugins.specs.conform")
    end,
  },

  ------ A.I Plugins ------
  -- GitHub Copilot
  {
    "github/copilot.vim",
    lazy = false, -- Load immediately during startup
  },

  ------ Programming Plugins ------
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",            -- Required for general functionality
      "nvim-treesitter/nvim-treesitter", -- For better parsing and support
      "antoinemadec/FixCursorHold.nvim", -- Fix CursorHold performance
      "jfpedroza/neotest-elixir",        -- Elixir adapter
      "haydenmeade/neotest-jest",        -- JavaScript (Jest) adapter
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("plugins.specs.neotest")
    end,
  },

  -- nvim-cmp: Auto-completion plugin
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",   -- Buffer source for nvim-cmp
      "hrsh7th/cmp-path",     -- Path source for nvim-cmp
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        -- Add different completion sources
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- Completion from LSP
          { name = "buffer" },   -- Completion from current buffer
          { name = "path" },     -- Completion for file paths
        }),

        -- Default mapping preset
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion menu
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        }),

        -- Snippet support
        snippet = {
          expand = function(args)
            -- Native snippet expansion using Neovim 0.10+ feature
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
      })
    end,
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.specs.gitsigns")
    end,
  },

  ------ Language Server Plugins ------
  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.specs.lsp")
    end,
  },
})

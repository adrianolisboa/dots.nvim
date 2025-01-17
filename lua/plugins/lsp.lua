-- LSP configurations

-- Import lspconfig
local lspconfig = require("lspconfig")
local util = require("lspconfig.util") -- Utility functions for root detection

-- Lexical LSP configuration
lspconfig.lexical.setup({
  cmd = { "/Users/adriano/Projects/lexical/_build/dev/package/lexical/bin/start_lexical.sh" }, -- Path to the server script
  root_dir = function(fname)
    return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
  end,
  filetypes = { "elixir", "eelixir", "heex" }, -- Supported file types
  settings = {}, -- Optional server-specific settings
})

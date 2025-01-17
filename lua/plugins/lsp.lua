-- LSP configurations

-- Import lspconfig
local lspconfig = require("lspconfig")
local util = require("lspconfig.util") -- Utility functions for root detection

-- Import cmp_nvim_lsp to extend capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lexical LSP configuration
lspconfig.lexical.setup({
  cmd = { "/Users/adriano/Projects/lexical/_build/dev/package/lexical/bin/start_lexical.sh" }, -- Path to the server script
  root_dir = function(fname)
    return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
  end,
  filetypes = { "elixir", "eelixir", "heex" }, -- Supported file types
  capabilities = capabilities, -- Enable nvim-cmp capabilities for this server
  settings = {}, -- Optional server-specific settings
})

-- Add configurations for other language servers here
-- Example: Pyright
lspconfig.pyright.setup({
  capabilities = capabilities, -- Enable nvim-cmp capabilities
})

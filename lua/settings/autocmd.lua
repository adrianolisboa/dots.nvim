-- Automatically resize splits when resizing Neovim
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
})

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

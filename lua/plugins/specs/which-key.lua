local wk = require("which-key")

wk.setup({
  plugins = {
    marks = true, -- Show marks
    registers = true, -- Show registers
    spelling = { enabled = true, suggestions = 20 }, -- Enable spelling suggestions
  },
  win = { -- Replace deprecated `window` with `win`
    border = "rounded", -- Rounded borders for the popup
    position = "bottom", -- Position the popup at the bottom
    margin = { 1, 0, 1, 0 }, -- Window margins
    padding = { 2, 2, 2, 2 }, -- Content padding
  },
  layout = {
    align = "center", -- Align content to the center
  },
  show_help = true, -- Show help text in the popup
})

local neotest = require("neotest")

neotest.setup({
  adapters = {
    -- Elixir adapter configuration
    require("neotest-elixir")({
      mix_task = "test",
      mix_args = nil,
    }),

    -- Jest adapter configuration for JavaScript/TypeScript
    require("neotest-jest")({
      jestCommand = "npm test --",
      env = { CI = true }, -- Optional: Customize environment variables
      cwd = function()
        return vim.fn.getcwd()
      end,
    }),
  },
})

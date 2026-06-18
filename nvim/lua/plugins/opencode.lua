return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  config = function()
    vim.g.opencode_opts = {}
    vim.o.autoread = true
  end,
  keys = {
    { "<leader>o", nil, desc = "OpenCode" },
    { "<leader>oa", function() require("opencode").ask("@this: ") end, desc = "Ask OpenCode" },
    { "<leader>os", function() require("opencode").select() end, desc = "Select OpenCode" },
  },
  init = function()
    vim.keymap.set({ "n", "x" }, "go", function()
      return require("opencode").operator("@this ")
    end, { desc = "Append range to OpenCode", expr = true })
    vim.keymap.set("n", "goo", function()
      return require("opencode").operator("@this ") .. "_"
    end, { desc = "Append line to OpenCode", expr = true })
  end,
}

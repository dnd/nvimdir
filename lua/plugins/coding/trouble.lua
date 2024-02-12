return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    local map = vim.keymap.set
    local trouble = require("trouble")

    map("n", "<leader>xx", function() trouble.toggle() end)
    map("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end)
    map("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end)
    map("n", "<leader>xq", function() trouble.toggle("quickfix") end)
    map("n", "<leader>xl", function() trouble.toggle("loclist") end)
    map("n", "gR", function() trouble.toggle("lsp_references") end)
  end
}

return {
  -- fork of simrat39/symbols-outline.nvim after archive
  "hedyhli/outline.nvim",
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>oc", "<cmd>Outline<CR>", desc = "Toggle code outline" }
  },
  config = function()
    require("outline").setup({})
  end
}

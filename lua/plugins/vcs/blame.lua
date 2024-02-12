return {
  "FabijanZulj/blame.nvim",
  cmd = { "ToggleBlame" },
  config = function()
    vim.keymap.set("n", "<leader>gB", ":ToggleBlame window<CR>", { desc = "Toggle blame window" })
  end
}

return {
  -- TODO: replace after configuring toggleterm
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>gl", ":LazyGit<cr>", { desc = "Open LazyGit" })
  end
}

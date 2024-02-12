return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<F2>", ":Neotree filesystem toggle left<CR>", {})
    vim.keymap.set("n", "<C-n><C-b>", ":Neotree buffers reveal float<CR>", {})
  end,
}

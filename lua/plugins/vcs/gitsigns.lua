return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      current_line_blame_opts = {
        delay = 250,
      },
      on_attach = function(_)
        local gs = package.loaded.gitsigns
        vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle current line blame" })
      end
    })
  end
}

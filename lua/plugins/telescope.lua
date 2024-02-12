return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            }
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      local map = vim.keymap.set
      map("n", "<leader>ta", builtin.grep_string, {})
      map("n", "<leader>tb", builtin.buffers, {})
      map("n", "<leader>tc", builtin.treesitter, {})
      map("n", "<leader>td", builtin.diagnostics, {})
      map("n", "<leader>tg", builtin.live_grep, {})
      map("n", "<leader>th", builtin.help_tags, {})
      map("n", "<leader>tm", builtin.marks, {})
      map("n", "<leader>tq", builtin.quickfix, {})
      map("n", "<leader>tt", builtin.find_files, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}

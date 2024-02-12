return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = { "<C-\\>" },
  cmd = { "T" },
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return math.min(vim.o.lines * 0.4, 25)
        elseif term.direction == "vertical" then
          return math.min(vim.o.columns * 0.5, 100)
        end
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = -30,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = false,
      direction = "vertical",
      close_on_exit = true,
      float_opts = {
        border = "rounded",
        width = math.floor(vim.o.columns * 0.85),
        height = math.floor(vim.o.lines * 0.8),
        winblend = 15,
        highlights = {
          border = "Normal",
          background = "Normal",
        }
      },
      highlights = {
        StatusLine   = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
      }
    })

    vim.keymap.set("n", "<C-\\>h", ":ToggleTerm direction=horizontal<CR>", { desc = "Open horizontal terminal" })
    vim.keymap.set("n", "<C-\\>v", ":ToggleTerm direction=vertical<CR>", { desc = "Open horizontal terminal" })
  end
}

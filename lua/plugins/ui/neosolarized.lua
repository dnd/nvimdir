return {
  "Tsuzat/NeoSolarized.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("NeoSolarized").setup({
      enable_italics = false,
      transparent = false,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        string = { italic = false },
      }
    })

    vim.cmd.colorscheme "NeoSolarized"
  end,
}

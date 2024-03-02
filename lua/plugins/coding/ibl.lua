return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    vim.api.nvim_set_hl(0, "IblCustomIndent", { fg = "#094656" })
    vim.api.nvim_set_hl(0, "IblCustomScope", { fg = "#0d6379" })

    require("ibl").setup({
      indent = {
        char = "▏",
        highlight = { "IblCustomIndent" },
      },
      
      scope = {
        char = "▍",
        highlight = { "IblCustomScope" },
        show_start = false,
      }
    })
  end
}

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
  },
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      -- ensure_installed = {
      --   "go",
      --   "javascript",
      --   "typescript",
      --   "json",
      --   "jsonc",
      --   "lua",
      --   "python",
      --   "html",
      --   "yaml",
      --   "css",
      --   "markdown",
      --   "markdown_inline",
      --   "ruby",
      --   "graphql",
      -- },
      highlight = { enable = true },
      indent = { enable = true },
      endwise = { enable = true },
    })
  end
}

return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      sources = {
        formatting.stylua,
        formatting.prettier,
        diagnostics.commitlint,
        diagnostics.erb_lint,
        diagnostics.hadolint,
        diagnostics.rubocop,
        formatting.rubocop,
        formatting.terraform_fmt,
        diagnostics.terraform_validate,
        diagnostics.tfsec,
      }
    })

  end
}

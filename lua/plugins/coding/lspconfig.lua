return {
  {
    "j-hui/fidget.nvim",
    version = "*",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "j-hui/fidget.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("fidget").setup({})

      require("mason").setup({
        ui = { border = "rounded" }
      })

      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        automatic_installation = true
      })

      local notify_opts = { title = "LSP Config" }

      mason_lspconfig.setup_handlers({
        function(server_name)
          if server_name == "rubocop" then
            return
          end

          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          vim.notify(string.format("Setting up LSP for: %s", server_name), vim.log.levels.DEBUG, notify_opts)
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,
        ["ruby_ls"] = function()
          -- Prefer `ruby-lsp` as the LSP server when available
          -- TODO: decide if this should be smarter, and try to force `ruby-lsp` when ruby
          -- version is >= 3
          vim.fn.jobstart("gem search --installed --silent --exact ruby-lsp", {
            on_exit = function(_, data, _)
              local capabilities = require("cmp_nvim_lsp").default_capabilities()
              local lspconfig = require("lspconfig")

              -- textDocument/diagnostic support until 0.10.0 is released
              _timers = {}
              local function setup_diagnostics(client, buffer)
                if require("vim.lsp.diagnostic")._enable then
                  return
                end

                local diagnostic_handler = function()
                  local params = vim.lsp.util.make_text_document_params(buffer)
                  client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
                    if err then
                      local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
                      vim.lsp.log.error(err_msg)
                    end
                    local diagnostic_items = {}
                    if result then
                      diagnostic_items = result.items
                    end
                    vim.lsp.diagnostic.on_publish_diagnostics(
                      nil,
                      vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
                      { client_id = client.id }
                    )
                  end)
                end

                diagnostic_handler() -- to request diagnostics on buffer when first attaching

                vim.api.nvim_buf_attach(buffer, false, {
                  on_lines = function()
                    if _timers[buffer] then
                      vim.fn.timer_stop(_timers[buffer])
                    end
                    _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
                  end,
                  on_detach = function()
                    if _timers[buffer] then
                      vim.fn.timer_stop(_timers[buffer])
                    end
                  end,
                })
              end

              if data == 0 then
                vim.notify("Setting up ruby-lsp LSP handler", vim.log.levels.DEBUG, notify_opts)
                lspconfig.ruby_ls.setup({
                  capabilities = capabilities,
                  -- on_attach = function(client, buffer)
                  --   setup_diagnostics(client, buffer)
                  -- end
                })
              else
                vim.notify("Setting up rubocop LSP handler", vim.log.levels.INFO, notify_opts)
                -- lspconfig.rubocop.setup({ capabilities = capabilities })
              end
            end
          })
        end,
      })
    end
  }
}

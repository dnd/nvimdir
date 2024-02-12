local aucmd = vim.api.nvim_create_autocmd
local function augroup(name, fnc)
  fnc(vim.api.nvim_create_augroup(name, { clear = true }))
end

augroup("Telescope", function(g)
  aucmd("FileType", {
    group = g,
    pattern = "TelescopeResults",
    command = "setlocal nofoldenable"
  })
end)

augroup("NumberToggle", function(g)
  aucmd({ "BufEnter", "FocusGained" }, {
    group = g,
    pattern = "*",
    command = [[ set relativenumber ]]
  })

  aucmd({ "BufLeave", "FocusLost" }, {
    group = g,
    pattern = "*",
    command = [[ set norelativenumber ]]
  })

  aucmd({ "BufEnter", "FocusGained" }, {
    group = g,
    pattern = "*",
    callback = function(opts)
      local ft = vim.bo[opts.buf].filetype

      if ft == "Outline" or ft == "Trouble" or ft == "toggleterm" then
        vim.cmd [[ setlocal nonumber norelativenumber ]]
      end
    end
  })
end)

augroup("Help", function(g)
  aucmd("FileType", {
    group = g,
    pattern = "help",
    command = [[ nnoremap q :q<CR>]]
  })
end)

local map = vim.keymap.set
--
-- Fix common typos
vim.cmd([[
  cnoreabbrev Q q
  cnoreabbrev Q! q!
  cnoreabbrev Q1 q!
  cnoreabbrev Qa qa
  cnoreabbrev Qa! qa!
  cnoreabbrev Qall qall
  cnoreabbrev Qall! qall!
  cnoreabbrev W w
  cnoreabbrev W! w!
  cnoreabbrev W1 w!
  cnoreabbrev WQ wq
  cnoreabbrev WQ1 wq!
  cnoreabbrev Wa wa
  cnoreabbrev Wq wq
  cnoreabbrev Wq1 wq!
  cnoreabbrev q1 q!
  cnoreabbrev w1 w!
  cnoreabbrev wQ wq
  cnoreabbrev wQ1 wq!
  cnoreabbrev wq1 wq!
]])

-- Turn off search match highlighting
map("n", "<leader><space>", "<Esc>:nohlsearch<CR>", { silent = true })

-- Reaching for ESC is annoying
map("i", "jj", "<Esc>", { remap = false })

-- Need to remap localleader if we want this convenience
-- map("n", ";", ":", { remap = false })

-- Window navigation
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-l>", "<C-W>l")

-- Tab navigation
map("n", "<M-1>", ":tabn 1<CR>", { silent = true })
map("n", "<M-2>", ":tabn 2<CR>", { silent = true })
map("n", "<M-3>", ":tabn 3<CR>", { silent = true })
map("n", "<M-4>", ":tabn 4<CR>", { silent = true })
map("n", "<M-5>", ":tabn 5<CR>", { silent = true })
map("n", "<M-6>", ":tabn 6<CR>", { silent = true })
map("n", "<M-7>", ":tabn 7<CR>", { silent = true })
map("n", "<M-8>", ":tabn 8<CR>", { silent = true })
map("n", "<M-9>", ":tabn 9<CR>", { silent = true })
map("n", "<M-0>", ":tablast<CR>", { silent = true })

-- Terminal maps
map("t", "<Esc><Esc>", [[<C-\><C-n>]])
map("t", "<C-w>", [[<C-\><C-n><C-w>]], {})
map("t", "<C-r>", [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true })

-- Move lines up/down
map("x", "K", ":move '<-2<CR>gv=gv", {})
map("x", "J", ":move '>+1<CR>gv=gv", {})

-- keep visual selection when (de)indenting
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

-- find and replace
map("n", "<leader>sr", ":%s/", { desc = "Find and replace in file" })
map("v", "<leader>sr", ":s/", { desc = "Find and replace in file" })

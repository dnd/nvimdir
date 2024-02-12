local o = vim.opt

o.termguicolors = true

o.updatetime = 250
o.timeout = true
o.timeoutlen = 500
o.fileformat = "unix"
o.switchbuf = "useopen"
o.fileencoding = "utf-8"
o.history = 256
o.pastetoggle = "<F3>"
o.title = true
o.titlestring = "nvim %f"

o.clipboard = "unnamedplus"

o.matchpairs    = { "(:)", "{:}", "[:]", "<:>" }
o.showmatch = true

o.autowrite = true
o.laststatus = 2
o.scrolloff = 3
o.sidescrolloff = 5
o.textwidth = 79
o.number = true
o.relativenumber = true
o.cursorline = true
o.signcolumn = "yes"
--vim.g._colorcolumn = 80
--o.colorcolumn = tostring(vim.g._colorcolumn)
o.breakindent = true
o.linebreak = false

o.listchars        = {
  tab      = "→ ",
  eol      = "↲",
  nbsp     = "␣",
  lead     = "␣",
  space    = "␣",
  trail    = "•",
  extends  = "⟩",
  precedes = "⟨",
}
o.showbreak        = "↪ "

o.completeopt = { "noinsert", "menuone", "noselect" }

o.smartindent = true
o.startofline = false

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.shiftround = true
o.expandtab = true

o.wrap = false
o.formatoptions    = o.formatoptions
    - "a"                                   -- Auto formatting is BAD.
    - "t"                                   -- Don't auto format my code. I got linters for that.
    + "c"                                   -- In general, I like it when comments respect textwidth
    + "q"                                   -- Allow formatting comments w/ gq
    - "o"                                   -- O and o, don't continue comments
    + "r"                                   -- But do continue when pressing enter.
    + "n"                                   -- Indent past the formatlistpat, not underneath it.
    + "j"                                   -- Auto-remove comments if possible.
    - "2"                                   -- I'm not in gradeschool anymore

o.splitbelow = true
o.splitright = true

o.foldenable = false
o.foldmethod = "indent"

o.undofile = false
o.hidden = true

o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true

o.writebackup = false
o.swapfile = false

vim.g.mapleader = ","
vim.g.maplocalleader = ";"

local o = vim.opt

o.list = true -- Display unprintable characters f12 - switches
o.listchars = 'tab:• ,trail:•,extends:»,precedes:«' -- unprintable chars

o.hidden = true
o.lazyredraw = true

o.undofile = true
o.swapfile = true

-- tab stuff
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- search
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.showmatch = true
o.incsearch = true
o.path:append('**') -- search into subfolders

o.cursorline = true
o.wildmenu = true -- show all matches at once
o.scrolloff = 8 -- 8 line margin for scrolling
o.colorcolumn = {81, 101} -- column indicators
o.relativenumber = true
o.number = true

o.mouse = 'a'

o.foldmethod = 'indent'
o.foldlevel = 99

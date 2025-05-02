vim.g.mapleader = " "
local k = vim.keymap.set
-- split navigation using ctrl+{h,j,k,l}
k('n', '<C-J>', '<C-W><C-J>')
k('n', '<C-K>', '<C-W><C-K>')
k('n', '<C-L>', '<C-W><C-L>')
k('n', '<C-H>', '<C-W><C-H>')

-- swap ; and :
k('n', ';', ':')
k('n', ':', ';')

-- netrw
k('n', '<leader>rw', vim.cmd.Ex)

k('v', '<C-r>', '"hy:%s/<C-r>h//g<left><left>') -- ctrl-R in visual mode to replace in whole file

k("n", "<leader>f", vim.lsp.buf.format)

-- git
k("n", "<leader>gs", ':Git<CR>')
k("n", "<leader>gc", ':Git commit<CR>')


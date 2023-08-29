local k = vim.keymap.set
-- split navigation using ctrl+{h,j,k,l}
k('n', '<C-J>', '<C-W><C-J>')
k('n', '<C-K>', '<C-W><C-K>')
k('n', '<C-L>', '<C-W><C-L>')
k('n', '<C-H>', '<C-W><C-H>')

-- swap ; and :
k('n', ';', ':')
k('n', ':', ';')

k('n', '<space>', 'za') -- fold using space

k('n', '<C-c>', ':bp|bd #<CR>') -- close buiffer without closing window

k('v', '<C-r>', '"hy:%s/<C-r>h//g<left><left>') -- ctrl-R in visual mode to replace in whole file
k('v', '<C-g>', ':ChatGPTRun complete_code')

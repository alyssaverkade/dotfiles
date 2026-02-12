vim.g.mapleader = " "
vim.g.localleader = "\\"

vim.keymap.set('n', '<F1>', ':Explore<CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<leader>/', ':FZF<CR>', { noremap = true })
vim.keymap.set('n', '<leader>b', ':Buffers<CR>', { noremap = true })
vim.keymap.set('n', '<leader>s', ':VSSplitabove<CR>', { noremap = true })
-- vim.keymap.set('ia', 'that', 'that')
-- vim.keymap.set('ia', 'the', 'the')
-- vim.keymap.set('ia', 'the', 'the')

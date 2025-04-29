vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set('n', 'x', '"_x', opts)

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR', opts)

vim.keymap.set('n', '<leader>v', '<C-w>v', opts)
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts)

vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts)
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)

vim.keymap.set('n', '<leader>cp', ':CccPick<CR>', opts)

vim.keymap.set('n', '<leader>lg', ':FzfLua live_grep<CR>', opts)

vim.keymap.set('n', '<leader>gl', ':FzfLua live_grep_glob<CR>', opts)

vim.keymap.set('n', '<leader>fl', ':FzfLua files<CR>', opts)

vim.keymap.set('n', '<leader>cs', ':FzfLua colorschemes<CR>', opts)

vim.keymap.set('n', '<leader>bf', ':FzfLua buffers<CR>', opts)

vim.keymap.set('n', '<leader>ul', ':Mason<CR>', opts)

vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

vim.keymap.set('n', '<leader>ma', '<cmd>set ma<CR>', opts)
vim.keymap.set('n', '<leader>nm', '<cmd>set noma<CR>', opts)

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', 'p', '"_dP', opts)

-- Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Save and load session
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })

--Luasnip settings
vim.keymap.set({ 'i', 's' }, '<C-j>', "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.keymap.set({ 'i', 's' }, '<C-k>', "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
-- set keybinds for both INSERT and VISUAL.
--
vim.keymap.set({ 'i', 's' }, '<A-n>', "<cmd>lua require'luasnip'.change_choice(1)<CR>", opts)

vim.keymap.set({ 'i', 's' }, '<A-p>', "<cmd>lua require'luasnip'.change_choice(-1)<CR>", opts)

vim.keymap.set({ 'i', 's' }, '<A-m>', "<cmd>lua require 'luasnip'.invalidate('e9')<CR>", opts)

vim.keymap.set({ 'i', 's' }, '<A-r>', "<cmd>lua require 'luasnip'.refresh_notify('html')<CR>", opts)

return {
  'cbochs/grapple.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  },

  opts = {
    scope = 'git', -- also try out "git_branch"
  },
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  config = function()
    vim.keymap.set('n', '<leader>m', '<cmd>Grapple toggle<cr>')
    vim.keymap.set('n', '<leader>M', '<cmd>Grapple toggle_tags<cr>')
    vim.keymap.set('n', '<leader>n', '<cmd>Grapple cycle_tags next<cr>')
    vim.keymap.set('n', '<leader>p', '<cmd>Grapple cycle_tags prev<cr>')
    vim.keymap.set('n', '<leader>1', '<cmd>Grapple select index=1<cr>')
    vim.keymap.set('n', '<leader>tg ', '<cmd>Grapple tag<cr>')
    vim.keymap.set('n', '<leader>BL', '<cmd>Grapple use_scope cwd<cr>')
    vim.keymap.set('n', '<leader>BG', '<cmd>Grapple use_scope global<cr>')
    vim.keymap.set('n', '<leader>GT', '<cmd>Grapple use_scope git<cr>')
    vim.keymap.set('n', '<leader>GB', '<cmd>Grapple use_scope git_branch<cr>')
    vim.keymap.set('n', '<leader>ts', '<cmd>Grapple toggle_scopes<cr>')
    vim.keymap.set('n', '<leader>tls', '<cmd>Grapple toggle_loaded<cr>')

    require('grapple').setup {}

    require('telescope').load_extension 'grapple'
  end,
}

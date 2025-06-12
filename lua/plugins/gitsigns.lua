-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function()
      local gs = package.loaded.gitsigns

      -- Keymaps for diffing
      vim.keymap.set('n', '<leader>gd', gs.diffthis, { buffer = bufnr, desc = 'Git Diff (current file)' })
      vim.keymap.set('n', '<leader>gD', function()
        gs.diffthis '~'
      end, { buffer = bufnr, desc = 'Git Diff (last commit)' })

      -- Optional: stage/unstage hunks
      vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { buffer = bufnr, desc = 'Stage hunk' })
      vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk, { buffer = bufnr, desc = 'Undo stage hunk' })
    end,
  },
}

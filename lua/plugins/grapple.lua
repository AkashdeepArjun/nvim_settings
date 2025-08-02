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
    -- vim.keymap.set('n', '<leader>tg ', '<cmd>Grapple tag<cr>)
    vim.keymap.set('n', '<leader>tg', function()
      vim.ui.input({ prompt = 'Tag name: ' }, function(input)
        if input and input ~= '' then
          require('grapple').tag { key = input }
        end
      end)
    end, { desc = 'Grapple: tag buffer with custom key (shows in Telescope)' })

    vim.keymap.set('n', '<leader>BL', '<cmd>Grapple use_scope cwd<cr>')
    vim.keymap.set('n', '<leader>BG', '<cmd>Grapple use_scope global<cr>')
    vim.keymap.set('n', '<leader>GT', '<cmd>Grapple use_scope git<cr>')
    vim.keymap.set('n', '<leader>GB', '<cmd>Grapple use_scope git_branch<cr>')
    vim.keymap.set('n', '<leader>ts', '<cmd>Grapple toggle_scopes<cr>')
    vim.keymap.set('n', '<leader>tls', '<cmd>Grapple toggle_loaded<cr>')

    -- require('grapple').setup {}
    require('grapple').setup {
      scope = 'git', -- or "project" or "cwd", as per your preference

      -- Save line + col when tagging
      resolve = function()
        local path = vim.fn.expand '%:p'
        local cursor = vim.api.nvim_win_get_cursor(0)
        return {
          path = path,
          line = cursor[1],
          col = cursor[2] + 1, -- +1 because vim uses 0-based columns
        }
      end,

      -- Restore cursor when opening
      open = function(tag)
        vim.cmd 'bdelete!'
        vim.schedule(function()
          vim.cmd('edit ' .. tag.path)
          if tag.line and tag.col then
            vim.api.nvim_win_set_cursor(0, { tag.line, tag.col - 1 }) -- -1 to match vim API
          end
        end)
      end,
    }
    require('telescope').load_extension 'grapple'
  end,
}

-- Add to your plugin manager
return {
  'folke/zen-mode.nvim',
  config = function()
    require('zen-mode').setup {
      window = {
        -- width = 0.85,
        width = vim.o.columns,
        options = {
          -- signcolumn = 'no',
          -- number = false,
          -- relativenumber = false,
          -- cursorline = false,
          -- foldcolumn = '0',
        },
      },
      plugins = {
        tmux = { enabled = true },
        twilight = { enabled = false },
        gitsigns = { enabled = false },
      },
    }
  end,
}

-- Keymap
-- vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { noremap = true, silent = true })

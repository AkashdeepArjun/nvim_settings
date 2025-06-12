return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<leader>cll',
      function()
        require('flash').jump {
          search = {
            mode = 'fuzzy',
          },
          label = {
            after = { 0, 0 },
            before = false,
            style = 'inline',
          },
          pattern = vim.fn.getline '.',
        }
      end,
      desc = 'Fuzzy jump in current line',
      mode = 'n',
    },
  },
}

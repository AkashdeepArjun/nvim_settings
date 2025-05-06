return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },

    config = function()
      local ls = require 'luasnip'
      local events = require 'luasnip.util.events'

      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_lua').load {
        paths = '/home/akashdeep/.config/nvim/LuaSnip/',
        fs_event_providers = {
          libuv = true,
        },
      }

      -- vim.api.nvim_create_autocmd('User', {
      --   pattern = 'LuasnipInsertNodeLeave',
      --   callback = function()
      --     -- Force reindent current line
      --     vim.cmd 'normal! =='
      --   end,
      -- })

      -- ls.config.set_config {
      --   enable_autosnippets = true,
      --   update_events = 'TextChanged,TextChangedI',
      --   region_check_events = 'InsertEnter',
      --   store_selection_keys = '<Tab>',
      --   callbacks = {
      --     [events.enter] = function()
      --       if vim.bo.filetype == 'html' then
      --         vim.b._original_indentexpr = vim.bo.indentexpr
      --         vim.bo.indentexpr = ''
      --         vim.bo.autoindent = true
      --       end
      --     end,
      --     [events.leave] = function()
      --       if vim.bo.filetype == 'html' and vim.b._original_indentexpr then
      --         vim.bo.indentexpr = vim.b._original_indentexpr
      --       end
      --     end,
      --   },
      -- }
    end,
  },
}

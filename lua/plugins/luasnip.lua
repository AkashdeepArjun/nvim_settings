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
      ls.filetype_extend('php', { 'html' })
      require('luasnip').config.set_config {
        history = true,
        updateevents = 'TextChanged,TextChangedI',
        enable_autosnippets = true,
        -- This is the key part:
        indent = {
          char = '	', -- or "    " if you're using spaces
        },
      }

      -- vim.api.nvim_create_autocmd('User', {
      --   pattern = 'LuasnipInsertNodeLeave',
      --   callback = function()
      --     -- Force reindent current line
      --     vim.cmd [[normal! `[='] ]]
      --   end,
      -- })

      -- vim.api.nvim_create_autocmd('User', {
      --   pattern = 'LuasnipExpand',
      --   callback = function()
      --     vim.schedule(function()
      --       local start_pos = vim.fn.getpos("'[")[2]
      --       local end_pos = vim.fn.getpos("']")[2]
      --
      --       if start_pos > 0 and end_pos > 0 then
      --         vim.cmd(string.format('silent %d,%dnormal! ==', start_pos, end_pos))
      --       end
      --     end)
      --   end,
      -- })

      vim.api.nvim_create_autocmd('User', {
        pattern = 'LuasnipExpand',
        callback = function()
          vim.schedule(function()
            local start_pos = vim.fn.getpos("'[")[2]
            local end_pos = vim.fn.getpos("']")[2]

            if start_pos > 0 and end_pos > 0 then
              -- Move to start, visually select to end, then indent
              vim.cmd(string.format('normal! %dGV%dG=', start_pos, end_pos))
            end
          end)
        end,
      })

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

return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },



    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_lua').load {
        paths = '/home/akashdeep/.config/nvim/LuaSnip/',
        fs_event_providers = {
          libuv = true,
        },
      }
    end,
  },
}

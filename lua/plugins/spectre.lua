return {
  'nvim-pack/nvim-spectre',
  config = function()
    require('spectre').setup {
      open_cmd = 'vnew',     -- or 'float' for floating window
      live_update = true,    -- live result updating
      is_insert_mode = true, -- start in insert mode
    }
  end,
}

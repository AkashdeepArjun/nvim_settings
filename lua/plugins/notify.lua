return {
  'rcarriga/nvim-notify',
  config = function()
    local notify = require 'notify'
    notify.setup {
      stages = 'fade', -- smooth fade in/out
      timeout = 2000, -- 2 seconds display
      background_colour = '#000000', -- blend with dark bg
      render = 'minimal', -- clean display
      top_down = true, -- top-down stacking
      fps = 60,
      max_width = 80,
    }

    -- Override default notify
    vim.notify = notify
  end,
}

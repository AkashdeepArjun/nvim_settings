require 'core.options'

require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local default_color_scheme = 'nord'
local env_var_nvim_theme = os.getenv 'NVIM_THEME' or default_color_scheme

local themes = {
  nord = 'plugins.themes.nord',
  onedark = 'plugins.themes.onedark',
}
--require 'custom.php_toggle'
require('lazy').setup({
  -- require(themes[env_var_nvim_theme]),
  -- require 'plugins.colortheme',
  require 'plugins.themes.gruvbox',
  require 'plugins.neo-tree',
  require 'plugins.lualine',
  require 'plugins.bufferline',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocomplete',
  require 'plugins.none-ls',
  require 'plugins.gitsigns',
  require 'plugins.alpha',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  -- require 'plugins.color-picker',
  require 'plugins.fzf',
  -- require 'plugins.color-highlight',
  require 'plugins.neaterm',
  -- require 'plugins.themery',
  require 'plugins.marks',
  require 'plugins.auto_session',
  -- require 'plugins.muren',
  require 'plugins.tokyonight',
  require 'plugins.nvim-planery',
  require 'plugins.spectre',
  require 'plugins.ccc',
  require 'plugins.image',
  require 'plugins.grapple',
  require 'plugins.luasnip',
  require 'plugins.mini_surround',
  require 'plugins.treesitter',
}, {

  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- 🔽 PLACE YOUR AUTOCMD HERE
-- vim.api.nvim_create_autocmd('CursorMovedI', {
--   pattern = '*.html',
--   callback = function()
--     local line = vim.api.nvim_get_current_line()
--     local cursor_col = vim.fn.col '.'
--     local before_cursor = line:sub(1, cursor_col)
--
--     if before_cursor:match '<%?php.*' then
--       vim.bo.smartindent = false
--       vim.bo.autoindent = false
--     else
--       vim.bo.smartindent = true
--       vim.bo.autoindent = true
--     end
--   end,
-- })
--
--
--
--
-- vim.api.nvim_create_autocmd('CursorMovedI', {
--   pattern = '*.html',
--   callback = function()
--     local row, col = unpack(vim.api.nvim_win_get_cursor(0))
--     local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] or ''
--     local before_cursor = line:sub(1, col)
--
--     if before_cursor:match '<%?php' then
--       vim.bo.autoindent = false
--       vim.bo.smartindent = false
--       vim.cmd "echo 'PHP: autoindent OFF'"
--     else
--       vim.bo.autoindent = true
--       vim.bo.smartindent = true
--       vim.cmd "echo 'HTML: autoindent ON'"
--     end
--   end,
-- })
--
--
--
--
vim.api.nvim_create_autocmd({ 'InsertEnter', 'CursorMovedI' }, {
  pattern = '*.html',
  callback = function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local in_php_block = false

    for i = 1, row do
      local line = lines[i]
      if line:match '<%?php' then
        in_php_block = true
      elseif line:match '?>' then
        in_php_block = false
      end
    end

    if in_php_block then
      vim.bo.autoindent = false
      vim.bo.smartindent = false
      vim.cmd "echo 'Inside PHP: autoindent OFF'"
    else
      vim.bo.autoindent = true
      vim.bo.smartindent = true
      vim.cmd "echo 'Outside PHP: autoindent ON'"
    end
  end,
})

require 'custom.php_toggle' -- 🟢 Your custom logic goes here (AFTER plugins)

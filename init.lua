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

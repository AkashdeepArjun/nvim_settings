return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    auto_save_enabled = true,
    auto_restore_enabled = true,
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },

    -- log_level = 'debug',
  },
}

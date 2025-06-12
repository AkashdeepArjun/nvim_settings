return {
  -- Attach to the existing LSP setup in LazyVim
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        intelephense = {
          -- Optional: customize intelephense settings here
          settings = {
            intelephense = {
              environment = {
                includePaths = { './vendor' }, -- useful if you're using Composer
              },
              files = {
                maxSize = 5000000, -- increase for large projects
              },
            },
          },
        },
      },
    },
  },
}

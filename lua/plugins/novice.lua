-- Make sure you have 'MunifTanjim/nui.nvim' as a dependency
return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
    },
    config = function()
        require('noice').setup {
            cmdline = {
                enabled = true,
                view = 'cmdline_popup',
            },
            messages = {
                enabled = false, -- disable messages UI
            },
            notify = {
                enabled = false, -- disable notifications
            },
            lsp = {
                progress = { enabled = false },
                hover = { enabled = false },
                signature = { enabled = false },
            },
            views = {
                cmdline_popup = {
                    border = { style = 'rounded' },
                    position = {
                        row = 5,
                        col = '50%',
                    },
                    size = {
                        width = 60,
                        height = 'auto',
                    },
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
            },
        }
    end,
}

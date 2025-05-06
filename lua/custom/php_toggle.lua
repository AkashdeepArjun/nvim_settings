local ts_utils = require 'nvim-treesitter.ts_utils'

local function in_php_block()
    local node = ts_utils.get_node_at_cursor()
    while node do
        local type = node:type()
        if type == 'php_tag' or type == 'program' then
            return true
        end
        node = node:parent()
    end
    return false
end

vim.api.nvim_create_autocmd('CursorMoved', {
    pattern = '*.html',
    callback = function()
        local clients = vim.lsp.get_active_clients { bufnr = 0 }
        for _, client in ipairs(clients) do
            if client.name == 'html' then
                local inside_php = in_php_block()
                client.server_capabilities.documentFormattingProvider = not inside_php
                client.server_capabilities.documentRangeFormattingProvider = not inside_php
            end
        end
    end,
})

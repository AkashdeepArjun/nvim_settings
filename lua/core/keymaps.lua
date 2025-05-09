vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set('n', 'x', '"_x', opts)

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR', opts)

vim.keymap.set('n', '<leader>v', '<C-w>v', opts)
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts)

vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts)
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)

vim.keymap.set('n', '<leader>cp', ':CccPick<CR>', opts)

vim.keymap.set('n', '<leader>lg', ':FzfLua live_grep<CR>', opts)

vim.keymap.set('n', '<leader>gl', ':FzfLua live_grep_glob<CR>', opts)

vim.keymap.set('n', '<leader>fl', ':FzfLua files<CR>', opts)

vim.keymap.set('n', '<leader>cs', ':FzfLua colorschemes<CR>', opts)

vim.keymap.set('n', '<leader>bf', ':FzfLua buffers<CR>', opts)

vim.keymap.set('n', '<leader>ul', ':Mason<CR>', opts)

vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

vim.keymap.set('n', '<leader>ma', '<cmd>set ma<CR>', opts)
vim.keymap.set('n', '<leader>nm', '<cmd>set noma<CR>', opts)

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', 'p', '"_dP', opts)

-- Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Save and load session
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })

--Luasnip settings
vim.keymap.set({ 'i', 's' }, '<C-j>', "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.keymap.set({ 'i', 's' }, '<C-k>', "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
-- set keybinds for both INSERT and VISUAL.
--
vim.keymap.set({ 'i', 's' }, '<A-n>', "<cmd>lua require'luasnip'.change_choice(1)<CR>", opts)

vim.keymap.set({ 'i', 's' }, '<A-p>', "<cmd>lua require'luasnip'.change_choice(-1)<CR>", opts)

vim.keymap.set({ 'i', 's' }, '<A-m>', "<cmd>lua require 'luasnip'.invalidate('e9')<CR>", opts)

vim.keymap.set({ 'i', 's' }, '<A-r>', "<cmd>lua require 'luasnip'.refresh_notify('html')<CR>", opts)

-- Normal mode keymap to reload the current file
vim.keymap.set('n', '<leader>ld', function()
  vim.cmd ':e!'
  local bufname = vim.api.nvim_buf_get_name(0)

  local filename = vim.fn.fnamemodify(bufname, ':t') -- gets only the tail
  vim.notify('✅ current buffer loaded ' .. filename, vim.log.levels.INFO)
end, { desc = 'reload current file' })
--
-- -- Function: Prompt for search & replace in visual selection
-- vim.keymap.set('v', '<leader>sr', function()
--   -- Get selected text
--   local start_pos = vim.fn.getpos "'<"
--   local end_pos = vim.fn.getpos "'>"
--   local lines = vim.fn.getline(start_pos[2], end_pos[2])
--   local selected = table.concat(lines, ' ')
--
--   -- Prompt user
--   vim.ui.input({ prompt = "Replace '" .. selected .. "' with: " }, function(replacement)
--     if replacement and #replacement > 0 then
--       local cmd = string.format("'<,'>s/%s/%s/g", vim.fn.escape(selected, '/\\'), replacement)
--       vim.cmd(cmd)
--     end
--   end)
-- end, { desc = 'Popup Replace for Visual Selection' })

-- Function: Prompt for search & replace in visual selection
-- vim.keymap.set('v', '<leader>sr', function()
--   -- Get selected text
--   local start_pos = vim.fn.getpos "'<"
--   local end_pos = vim.fn.getpos "'>"
--
--   -- Ensure we grab the correct lines for a multi-line selection
--   local lines = vim.fn.getline(start_pos[2], end_pos[2])
--   if start_pos[2] == end_pos[2] then
--     -- If the selection is on a single line, just take the selected portion
--     lines = { vim.fn.getline(start_pos[2]):sub(start_pos[3], end_pos[3]) }
--   else
--     -- Handle case where the selection spans multiple lines
--     lines[1] = lines[1]:sub(start_pos[3]) -- start from the cursor position on the first line
--     lines[#lines] = lines[#lines]:sub(1, end_pos[3]) -- end at the cursor position on the last line
--   end
--
--   local selected = table.concat(lines, '\n') -- Concatenate all the lines, separated by newlines
--
--   -- Prompt user for replacement text
--   vim.ui.input({ prompt = 'Replace selection with: ' }, function(replacement)
--     if replacement and #replacement > 0 then
--       -- Create the search and replace command
--       local cmd = string.format("'<,'>s/%s/%s/g", vim.fn.escape(selected, '/\\'), replacement)
--       vim.cmd(cmd) -- Execute the search and replace in the visual selection
--     end
--   end)
-- end, { desc = 'Popup Replace for Visual Selection' })

-- vim.keymap.set('v', '<leader>sr', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local start_pos = vim.fn.getpos "'<"
--   local end_pos = vim.fn.getpos "'>"
--
--   local start_line = start_pos[2] - 1
--   local start_col = start_pos[3] - 1
--   local end_line = end_pos[2] - 1
--   local end_col = end_pos[3]
--
--   -- Get selected text
--   local selected_text = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local original_text = table.concat(selected_text, '\n')
--
--   -- Prompt for replacement
--   vim.ui.input({ prompt = 'Replace selection with:' }, function(replacement)
--     if replacement ~= nil then
--       local replacement_lines = vim.split(replacement, '\n', { plain = true })
--       vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replacement_lines)
--     end
--   end)
-- end, { desc = 'Popup Replace for Visual Selection' })

-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local start_pos = vim.fn.getpos "'<"
--   local end_pos = vim.fn.getpos "'>"
--
--   local start_line = start_pos[2] - 1
--   local start_col = start_pos[3] - 1
--   local end_line = end_pos[2] - 1
--   local end_col = end_pos[3]
--
--   -- Get selected text
--   local selected_text = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(selected_text, '\n')
--
--   -- Ask for pattern and replacement
--   vim.ui.input({ prompt = 'Regex pattern to search:' }, function(pattern)
--     if not pattern or pattern == '' then
--       return
--     end
--     vim.ui.input({ prompt = 'Replace with:' }, function(replacement)
--       if replacement == nil then
--         return
--       end
--
--       -- Do regex replacement in Lua
--       local ok, replaced = pcall(function()
--         return text:gsub(pattern, replacement)
--       end)
--
--       if ok then
--         local replaced_lines = vim.split(replaced, '\n', { plain = true })
--         vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--       else
--         vim.notify('Invalid regex or replacement', vim.log.levels.ERROR)
--       end
--     end)
--   end)
-- end, { desc = 'Regex Replace in Visual Selection' })

-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local start_pos = vim.fn.getpos "'<"
--   local end_pos = vim.fn.getpos "'>"
--
--   local start_line = start_pos[2] - 1
--   local start_col = start_pos[3] - 1
--   local end_line = end_pos[2] - 1
--   local end_col = end_pos[3]
--
--   local lines = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(lines, '\n')
--
--   -- Ask user for Lua pattern (not full regex)
--   vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--     if not pattern or pattern == '' then
--       return
--     end
--
--     vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--       if replacement == nil then
--         return
--       end
--
--       local ok, new_text = pcall(function()
--         return text:gsub(pattern, replacement)
--       end)
--
--       if ok then
--         local new_lines = vim.split(new_text, '\n', { plain = true })
--         vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, new_lines)
--       else
--         vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--       end
--     end)
--   end)
-- end, { desc = 'Search & Replace (Lua Pattern) in Visual Selection' })

-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local start_pos = vim.fn.getpos "'<"
--   local end_pos = vim.fn.getpos "'>"
--
--   local start_line = start_pos[2] - 1
--   local start_col = start_pos[3] - 1
--   local end_line = end_pos[2] - 1
--   local end_col = end_pos[3]
--
--   -- Clamp end_col to valid range
--   local last_line = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1]
--   if last_line then
--     end_col = math.min(end_col, #last_line)
--   end
--
--   -- Get selected text
--   local selected = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(selected, '\n')
--
--   -- Ask for Lua pattern
--   vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--     if not pattern or pattern == '' then
--       return
--     end
--
--     vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--       if replacement == nil then
--         return
--       end
--
--       local ok, replaced = pcall(function()
--         return text:gsub(pattern, replacement)
--       end)
--
--       if ok then
--         local replaced_lines = vim.split(replaced, '\n', { plain = true })
--         vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--       else
--         vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--       end
--     end)
--   end)
-- end, { desc = 'Regex-like Replace in Visual Selection (Lua Patterns)' })

-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local mode = vim.fn.mode()
--
--   local pos1 = vim.fn.getpos "'<"
--   local pos2 = vim.fn.getpos "'>"
--
--   -- Convert to 0-based indexing
--   local l1, c1 = pos1[2] - 1, pos1[3] - 1
--   local l2, c2 = pos2[2] - 1, pos2[3] - 1
--
--   -- Normalize selection direction
--   local start_line, start_col, end_line, end_col
--   if l1 < l2 or (l1 == l2 and c1 <= c2) then
--     start_line, start_col = l1, c1
--     end_line, end_col = l2, c2
--   else
--     start_line, start_col = l2, c2
--     end_line, end_col = l1, c1
--   end
--
--   -- In visual character mode, end_col is exclusive: include one more
--   if mode == 'v' then
--     end_col = end_col + 1
--   end
--
--   -- Clamp end_col to line length
--   local end_line_text = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1] or ''
--   end_col = math.min(end_col, #end_line_text)
--
--   -- Get selected text
--   local selected = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(selected, '\n')
--
--   if text == '' then
--     vim.notify('Nothing selected to replace', vim.log.levels.WARN)
--     return
--   end
--
--   -- Prompt for Lua pattern
--   vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--     if not pattern or pattern == '' then
--       return
--     end
--
--     vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--       if replacement == nil then
--         return
--       end
--
--       local ok, replaced = pcall(function()
--         return text:gsub(pattern, replacement)
--       end)
--
--       if ok then
--         local replaced_lines = vim.split(replaced, '\n', { plain = true })
--         vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--       else
--         vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--       end
--     end)
--   end)
-- end, { desc = 'Regex-like Replace in Visual Selection' })

-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local mode = vim.fn.mode()
--
--   -- Get the start and end positions of the visual selection
--   local pos1 = vim.fn.getpos "'<"
--   local pos2 = vim.fn.getpos "'>"
--
--   -- Convert to 0-based line and column indices
--   local l1, c1 = pos1[2] - 1, pos1[3] - 1
--   local l2, c2 = pos2[2] - 1, pos2[3] - 1
--
--   -- Normalize the start and end positions: make sure start < end
--   local start_line, start_col, end_line, end_col
--   if l1 < l2 or (l1 == l2 and c1 <= c2) then
--     start_line, start_col = l1, c1
--     end_line, end_col = l2, c2
--   else
--     start_line, start_col = l2, c2
--     end_line, end_col = l1, c1
--   end
--
--   -- If in visual character mode, include the last character (end_col is exclusive)
--   if mode == 'v' then
--     end_col = end_col + 1
--   end
--
--   -- Clamp end_col to the actual line length (don't go beyond the line's end)
--   local last_line_text = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1] or ''
--   end_col = math.min(end_col, #last_line_text)
--
--   -- Get the selected text based on the corrected start and end positions
--   local selected = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(selected, '\n')
--
--   -- If no text is selected, notify the user and return
--   if text == '' then
--     vim.notify('Nothing selected to replace', vim.log.levels.WARN)
--     return
--   end
--
--   -- Prompt for the search pattern
--   vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--     if not pattern or pattern == '' then
--       return
--     end
--
--     -- Prompt for the replacement text
--     vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--       if replacement == nil then
--         return
--       end
--
--       -- Perform the pattern replacement using Lua's gsub
--       local ok, replaced = pcall(function()
--         return text:gsub(pattern, replacement)
--       end)
--
--       -- If the replacement was successful, update the text in the buffer
--       if ok then
--         local replaced_lines = vim.split(replaced, '\n', { plain = true })
--         vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--       else
--         vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--       end
--     end)
--   end)
-- end, { desc = 'Regex-like Replace in Visual Selection (Fixed Bottom-to-Top)' })
--
--

-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local mode = vim.fn.mode()
--
--   -- Get the start and end positions of the visual selection
--   local pos1 = vim.fn.getpos "'<"
--   local pos2 = vim.fn.getpos "'>"
--
--   -- Convert to 0-based line and column indices
--   local l1, c1 = pos1[2] - 1, pos1[3] - 1
--   local l2, c2 = pos2[2] - 1, pos2[3] - 1
--
--   -- Normalize the start and end positions: make sure start < end
--   local start_line, start_col, end_line, end_col
--   if l1 < l2 or (l1 == l2 and c1 <= c2) then
--     start_line, start_col = l1, c1
--     end_line, end_col = l2, c2
--   else
--     start_line, start_col = l2, c2
--     end_line, end_col = l1, c1
--   end
--
--   -- Handle visual character mode: end_col is exclusive, so include it
--   if mode == 'v' then
--     end_col = end_col + 1
--   end
--
--   -- Handle left-to-right and right-to-left selections (ensure correct order)
--   if start_line == end_line then
--     if start_col > end_col then
--       -- Swap if right-to-left selection
--       start_col, end_col = end_col, start_col
--     end
--   elseif start_line > end_line or (start_line == end_line and start_col > end_col) then
--     -- Reverse the range for bottom-to-top selection
--     start_line, start_col, end_line, end_col = end_line, end_col, start_line, start_col
--   end
--
--   -- Clamp end_col to the actual line length (don't go beyond the line's end)
--   local end_line_text = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1] or ''
--   end_col = math.min(end_col, #end_line_text)
--
--   -- Get the selected text
--   local selected = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(selected, '\n')
--
--   -- If no text is selected, notify the user and return
--   if text == '' then
--     vim.notify('Nothing selected to replace', vim.log.levels.WARN)
--     return
--   end
--
--   -- Prompt for the Lua pattern
--   vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--     if not pattern or pattern == '' then
--       return
--     end
--
--     -- Prompt for the replacement text
--     vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--       if replacement == nil then
--         return
--       end
--
--       -- Perform the pattern replacement using Lua's gsub
--       local ok, replaced = pcall(function()
--         return text:gsub(pattern, replacement)
--       end)
--
--       -- If the replacement was successful, update the text in the buffer
--       if ok then
--         local replaced_lines = vim.split(replaced, '\n', { plain = true })
--         vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--       else
--         vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--       end
--     end)
--   end)
-- end, { desc = 'Regex-like Replace in Visual Selection (Handles All Directions)' })
--
--
--
--
--
--
-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local mode = vim.fn.mode()
--
--   -- Get the start and end positions of the visual selection
--   local pos1 = vim.fn.getpos "'<"
--   local pos2 = vim.fn.getpos "'>"
--
--   -- Convert to 0-based line and column indices
--   local l1, c1 = pos1[2] - 1, pos1[3] - 1
--   local l2, c2 = pos2[2] - 1, pos2[3] - 1
--
--   -- Normalize the start and end positions
--   -- Ensure start is always less than end (from top-to-bottom, left-to-right)
--   local start_line, start_col, end_line, end_col
--   if l1 < l2 or (l1 == l2 and c1 <= c2) then
--     start_line, start_col = l1, c1
--     end_line, end_col = l2, c2
--   else
--     start_line, start_col = l2, c2
--     end_line, end_col = l1, c1
--   end
--
--   -- Handle visual character mode: end_col is exclusive, so include it
--   if mode == 'v' then
--     end_col = end_col + 1
--   end
--
--   -- Ensure left-to-right selection order even if the user selected right-to-left
--   if start_line == end_line and start_col > end_col then
--     -- Swap the columns for right-to-left selection
--     start_col, end_col = end_col, start_col
--   end
--
--   -- Clamp end_col to the actual line length (don't go beyond the line's end)
--   local end_line_text = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1] or ''
--   end_col = math.min(end_col, #end_line_text)
--
--   -- Get the selected text
--   local selected = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(selected, '\n')
--
--   -- If no text is selected, notify the user and return
--   if text == '' then
--     vim.notify('Nothing selected to replace', vim.log.levels.WARN)
--     return
--   end
--
--   -- Prompt for the Lua pattern
--   vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--     if not pattern or pattern == '' then
--       return
--     end
--
--     -- Prompt for the replacement text
--     vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--       if replacement == nil then
--         return
--       end
--
--       -- Perform the pattern replacement using Lua's gsub
--       local ok, replaced = pcall(function()
--         return text:gsub(pattern, replacement)
--       end)
--
--       -- If the replacement was successful, update the text in the buffer
--       if ok then
--         local replaced_lines = vim.split(replaced, '\n', { plain = true })
--         vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--       else
--         vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--       end
--     end)
--   end)
-- end, { desc = 'Regex-like Replace in Visual Selection (Handles All Directions)' })

-- Keymap for replacing text in the current buffer
-- vim.keymap.set('n', '<leader>fb', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--
--   -- Get all the lines in the buffer
--   local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
--   local text = table.concat(lines, '\n')
--
--   -- Prompt for the Lua pattern
--   vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--     if not pattern or pattern == '' then
--       return
--     end
--
--     -- Prompt for the replacement text
--     vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--       if replacement == nil then
--         return
--       end
--
--       -- Perform the pattern replacement using Lua's gsub
--       local ok, replaced = pcall(function()
--         return text:gsub(pattern, replacement)
--       end)
--
--       -- If the replacement was successful, update the text in the buffer
--       if ok then
--         local replaced_lines = vim.split(replaced, '\n', { plain = true })
--         vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, replaced_lines)
--         vim.notify('Buffer replaced successfully', vim.log.levels.INFO)
--       else
--         vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--       end
--     end)
--   end)
-- end, { desc = 'Search and Replace Entire Buffer' })
--
--
--
--
-- vim.keymap.set('n', '<leader>fb', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--
--   -- Get all the lines in the buffer
--   local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
--   local text = table.concat(lines, '\n')
--
--   -- Prompt for the case-insensitive toggle
--   vim.ui.select({ 'Yes', 'No' }, {
--     prompt = 'Enable case-insensitive search?',
--   }, function(choice)
--     local case_insensitive = (choice == 'Yes')
--
--     -- Prompt for the Lua pattern
--     vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--       if not pattern or pattern == '' then
--         return
--       end
--
--       -- Prompt for the replacement text
--       vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--         if replacement == nil then
--           return
--         end
--
--         -- Modify the pattern if case-insensitive is enabled
--         if case_insensitive then
--           pattern = '(?i)' .. pattern
--         end
--
--         -- Perform the pattern replacement using Lua's gsub
--         local ok, replaced = pcall(function()
--           return text:gsub(pattern, replacement)
--         end)
--
--         -- If the replacement was successful, update the text in the buffer
--         if ok then
--           local replaced_lines = vim.split(replaced, '\n', { plain = true })
--           vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, replaced_lines)
--           vim.notify('Buffer replaced successfully', vim.log.levels.INFO)
--         else
--           vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--         end
--       end)
--     end)
--   end)
-- end, { desc = 'Search and Replace Entire Buffer with Case Toggle' })
--
--
--

vim.keymap.set('n', '<leader>fb', function()
  local bufnr = vim.api.nvim_get_current_buf()

  -- Get all the lines in the buffer
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local text = table.concat(lines, '\n')

  -- Prompt for the case-insensitive toggle
  vim.ui.select({ 'Yes', 'No' }, {
    prompt = 'Enable case-insensitive search?',
  }, function(choice)
    local case_insensitive = (choice == 'Yes')

    -- Prompt for the Lua pattern
    vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
      if not pattern or pattern == '' then
        return
      end

      -- Prompt for the replacement text
      vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
        if replacement == nil then
          return
        end

        -- Handle case-insensitivity manually by converting both pattern and text to lowercase
        if case_insensitive then
          pattern = pattern:lower() -- Convert pattern to lowercase
          text = text:lower()       -- Convert text to lowercase
        end

        -- Perform the pattern replacement using Lua's gsub (case-insensitive if selected)
        local ok, replaced = pcall(function()
          return text:gsub(pattern, replacement)
        end)

        -- If the replacement was successful, update the text in the buffer
        if ok then
          local replaced_lines = vim.split(replaced, '\n', { plain = true })
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, replaced_lines)
          vim.notify('Buffer replaced successfully', vim.log.levels.INFO)
        else
          vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
        end
      end)
    end)
  end)
end, { desc = 'Search and Replace Entire Buffer with Case Toggle' })

-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local mode = vim.fn.mode()
--
--   -- Get the start and end positions of the visual selection
--   local pos1 = vim.fn.getpos "'<"
--   local pos2 = vim.fn.getpos "'>"
--
--   -- Convert to 0-based line and column indices
--   local l1, c1 = pos1[2] - 1, pos1[3] - 1
--   local l2, c2 = pos2[2] - 1, pos2[3] - 1
--
--   -- Normalize the start and end positions
--   local start_line, start_col, end_line, end_col
--   if l1 < l2 or (l1 == l2 and c1 <= c2) then
--     start_line, start_col = l1, c1
--     end_line, end_col = l2, c2
--   else
--     start_line, start_col = l2, c2
--     end_line, end_col = l1, c1
--   end
--
--   -- Handle visual character mode: end_col is exclusive, so include it
--   if mode == 'v' then
--     end_col = end_col + 1
--   end
--
--   -- Ensure left-to-right selection order even if the user selected right-to-left
--   if start_line == end_line and start_col > end_col then
--     -- Swap the columns for right-to-left selection
--     start_col, end_col = end_col, start_col
--   end
--
--   -- Clamp end_col to the actual line length (don't go beyond the line's end)
--   local end_line_text = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1] or ''
--   end_col = math.min(end_col, #end_line_text)
--
--   -- Get the selected text
--   local selected = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(selected, '\n')
--
--   -- If no text is selected, notify the user and return
--   if text == '' then
--     vim.notify('Nothing selected to replace', vim.log.levels.WARN)
--     return
--   end
--
--   -- Prompt for the case-insensitive toggle
--   vim.ui.select({ 'Yes', 'No' }, {
--     prompt = 'Enable case-insensitive search?',
--   }, function(choice)
--     local case_insensitive = (choice == 'Yes')
--
--     -- Prompt for the Lua pattern
--     vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--       if not pattern or pattern == '' then
--         return
--       end
--
--       -- Prompt for the replacement text
--       vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--         if replacement == nil then
--           return
--         end
--
--         -- Handle case-insensitivity manually by converting both pattern and text to lowercase
--         if case_insensitive then
--           pattern = pattern:lower() -- Convert pattern to lowercase
--           text = text:lower() -- Convert selected text to lowercase
--         end
--
--         -- Perform the pattern replacement using Lua's gsub
--         local ok, replaced = pcall(function()
--           return text:gsub(pattern, replacement)
--         end)
--
--         -- If the replacement was successful, update the text in the buffer
--         if ok then
--           local replaced_lines = vim.split(replaced, '\n', { plain = true })
--           vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--           vim.notify('Visual selection replaced successfully', vim.log.levels.INFO)
--         else
--           vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--         end
--       end)
--     end)
--   end)
-- end, { desc = 'Search and Replace in Visual Selection with Case Toggle' })
--
--
--
--
--
--
-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local mode = vim.fn.mode()
--
--   -- Get the start and end positions of the visual selection
--   local pos1 = vim.fn.getpos "'<"
--   local pos2 = vim.fn.getpos "'>"
--
--   -- Convert to 0-based line and column indices
--   local l1, c1 = pos1[2] - 1, pos1[3] - 1
--   local l2, c2 = pos2[2] - 1, pos2[3] - 1
--
--   -- Normalize the start and end positions for correct selection direction
--   local start_line, start_col, end_line, end_col
--   if l1 < l2 or (l1 == l2 and c1 <= c2) then
--     start_line, start_col = l1, c1
--     end_line, end_col = l2, c2
--   else
--     start_line, start_col = l2, c2
--     end_line, end_col = l1, c1
--   end
--
--   -- Handle visual character mode: end_col is exclusive, so include it
--   if mode == 'v' then
--     end_col = end_col + 1
--   end
--
--   -- Handle reverse selection direction (right-to-left or bottom-to-top)
--   if start_line == end_line and start_col > end_col then
--     -- Swap columns for right-to-left selection
--     start_col, end_col = end_col, start_col
--   end
--
--   -- Clamp end_col to the actual line length (don't go beyond the line's end)
--   local end_line_text = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1] or ''
--   end_col = math.min(end_col, #end_line_text)
--
--   -- Get the selected text
--   local selected = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(selected, '\n')
--
--   -- If no text is selected, notify the user and return
--   if text == '' then
--     vim.notify('Nothing selected to replace', vim.log.levels.WARN)
--     return
--   end
--
--   -- Prompt for the case-insensitive toggle
--   vim.ui.select({ 'Yes', 'No' }, {
--     prompt = 'Enable case-insensitive search?',
--   }, function(choice)
--     local case_insensitive = (choice == 'Yes')
--
--     -- Prompt for the Lua pattern
--     vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--       if not pattern or pattern == '' then
--         return
--       end
--
--       -- Prompt for the replacement text
--       vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--         if replacement == nil then
--           return
--         end
--
--         -- Handle case-insensitivity manually by converting both pattern and text to lowercase
--         if case_insensitive then
--           pattern = pattern:lower() -- Convert pattern to lowercase
--           text = text:lower()       -- Convert selected text to lowercase
--         end
--
--         -- Perform the pattern replacement using Lua's gsub
--         local ok, replaced = pcall(function()
--           return text:gsub(pattern, replacement)
--         end)
--
--         -- If the replacement was successful, update the text in the buffer
--         if ok then
--           local replaced_lines = vim.split(replaced, '\n', { plain = true })
--           vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--           vim.notify('Visual selection replaced successfully', vim.log.levels.INFO)
--         else
--           vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--         end
--       end)
--     end)
--   end)
-- end, { desc = 'Search and Replace in Visual Selection with Case Toggle' })
--
--
--

-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local mode = vim.fn.mode()
--
--   -- Get the start and end positions of the visual selection
--   local pos1 = vim.fn.getpos "'<"
--   local pos2 = vim.fn.getpos "'>"
--
--   -- Convert to 0-based line and column indices
--   local l1, c1 = pos1[2] - 1, pos1[3] - 1
--   local l2, c2 = pos2[2] - 1, pos2[3] - 1
--
--   -- Ensure that the start line/column and end line/column are always in correct order
--   local start_line, start_col, end_line, end_col
--   if l1 < l2 or (l1 == l2 and c1 <= c2) then
--     start_line, start_col = l1, c1
--     end_line, end_col = l2, c2
--   else
--     start_line, start_col = l2, c2
--     end_line, end_col = l1, c1
--   end
--
--   -- If in character mode, we should include the end column (exclusive range)
--   if mode == 'v' then
--     end_col = end_col + 1
--   end
--
--   -- Clamp the end column to the line length to avoid going beyond the actual text
--   local end_line_text = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1] or ''
--   end_col = math.min(end_col, #end_line_text)
--
--   -- Get the selected text (from start_line/start_col to end_line/end_col)
--   local selected = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(selected, '\n')
--
--   -- If no text is selected, notify the user and return
--   if text == '' then
--     vim.notify('Nothing selected to replace', vim.log.levels.WARN)
--     return
--   end
--
--   -- Prompt for the case-insensitive toggle
--   vim.ui.select({ 'Yes', 'No' }, {
--     prompt = 'Enable case-insensitive search?',
--   }, function(choice)
--     local case_insensitive = (choice == 'Yes')
--
--     -- Prompt for the Lua pattern
--     vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--       if not pattern or pattern == '' then
--         return
--       end
--
--       -- Prompt for the replacement text
--       vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--         if replacement == nil then
--           return
--         end
--
--         -- Handle case-insensitivity: convert both pattern and selected text to lowercase if needed
--         if case_insensitive then
--           pattern = pattern:lower() -- Convert pattern to lowercase
--           text = text:lower()       -- Convert selected text to lowercase
--         end
--
--         -- Perform the pattern replacement using Lua's gsub
--         local ok, replaced = pcall(function()
--           return text:gsub(pattern, replacement)
--         end)
--
--         -- If the replacement was successful, update the text in the buffer
--         if ok then
--           local replaced_lines = vim.split(replaced, '\n', { plain = true })
--           vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--           vim.notify('Visual selection replaced successfully', vim.log.levels.INFO)
--         else
--           vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--         end
--       end)
--     end)
--   end)
-- end, { desc = 'Search and Replace in Visual Selection with Case Toggle' })
--

-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local mode = vim.fn.mode()
--
--   -- Get the start and end positions of the visual selection
--   local pos1 = vim.fn.getpos "'<"
--   local pos2 = vim.fn.getpos "'>"
--
--   -- Convert to 0-based line and column indices
--   local l1, c1 = pos1[2] - 1, pos1[3] - 1
--   local l2, c2 = pos2[2] - 1, pos2[3] - 1
--
--   -- Debugging: print positions
--   vim.notify(string.format('Visual start: line %d, col %d', l1, c1))
--   vim.notify(string.format('Visual end: line %d, col %d', l2, c2))
--
--   -- Ensure that the start line/column and end line/column are always in correct order
--   local start_line, start_col, end_line, end_col
--   if l1 < l2 or (l1 == l2 and c1 <= c2) then
--     start_line, start_col = l1, c1
--     end_line, end_col = l2, c2
--   else
--     start_line, start_col = l2, c2
--     end_line, end_col = l1, c1
--   end
--
--   -- If in character mode, we should include the end column (exclusive range)
--   if mode == 'v' then
--     end_col = end_col + 1
--   end
--
--   -- Clamp the end column to the line length to avoid going beyond the actual text
--   local end_line_text = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1] or ''
--   end_col = math.min(end_col, #end_line_text)
--
--   -- Get the selected text (from start_line/start_col to end_line/end_col)
--   local selected = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(selected, '\n')
--
--   -- If no text is selected, notify the user and return
--   if text == '' then
--     vim.notify('Nothing selected to replace', vim.log.levels.WARN)
--     return
--   end
--
--   -- Debugging: Check selected text
--   vim.notify(string.format('Selected text: %s', text))
--
--   -- Prompt for the case-insensitive toggle
--   vim.ui.select({ 'Yes', 'No' }, {
--     prompt = 'Enable case-insensitive search?',
--   }, function(choice)
--     local case_insensitive = (choice == 'Yes')
--
--     -- Prompt for the Lua pattern
--     vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--       if not pattern or pattern == '' then
--         return
--       end
--
--       -- Debugging: Check pattern
--       vim.notify(string.format('Pattern: %s', pattern))
--
--       -- Prompt for the replacement text
--       vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--         if replacement == nil then
--           return
--         end
--
--         -- Handle case-insensitivity: convert both pattern and selected text to lowercase if needed
--         if case_insensitive then
--           pattern = pattern:lower() -- Convert pattern to lowercase
--           text = text:lower()       -- Convert selected text to lowercase
--         end
--
--         -- Perform the pattern replacement using Lua's gsub
--         local ok, replaced = pcall(function()
--           return text:gsub(pattern, replacement)
--         end)
--
--         -- If the replacement was successful, update the text in the buffer
--         if ok then
--           local replaced_lines = vim.split(replaced, '\n', { plain = true })
--           vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--           vim.notify('Visual selection replaced successfully', vim.log.levels.INFO)
--         else
--           vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--         end
--       end)
--     end)
--   end)
-- end, { desc = 'Search and Replace in Visual Selection with Case Toggle' })
--
--
--
--
-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local mode = vim.fn.mode()
--
--   -- Get the start and end positions of the visual selection
--   local pos1 = vim.fn.getpos "'<"
--   local pos2 = vim.fn.getpos "'>"
--
--   -- Convert to 0-based line and column indices
--   local l1, c1 = pos1[2] - 1, pos1[3] - 1
--   local l2, c2 = pos2[2] - 1, pos2[3] - 1
--
--   -- Debugging: print positions
--   vim.notify(string.format('Visual start: line %d, col %d', l1, c1))
--   vim.notify(string.format('Visual end: line %d, col %d', l2, c2))
--
--   -- Ensure that the start line/column and end line/column are always in correct order
--   local start_line, start_col, end_line, end_col
--   if l1 < l2 or (l1 == l2 and c1 <= c2) then
--     start_line, start_col = l1, c1
--     end_line, end_col = l2, c2
--   else
--     start_line, start_col = l2, c2
--     end_line, end_col = l1, c1
--   end
--
--   -- If in character mode, we should include the end column (exclusive range)
--   if mode == 'v' then
--     end_col = end_col + 1
--   end
--
--   -- Handle multi-line selections: Get the text for multiple lines, adjusting for column positions
--   local selected_lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line + 1, false)
--
--   -- If the selection is over multiple lines, adjust the start and end columns accordingly
--   if start_line ~= end_line then
--     -- For the first line, take from the start column to the end of the line
--     selected_lines[1] = selected_lines[1]:sub(start_col + 1)
--
--     -- For the last line, take from the beginning of the line to the end column
--     selected_lines[#selected_lines] = selected_lines[#selected_lines]:sub(1, end_col)
--
--     -- For lines in the middle, take the whole line
--     for i = 2, #selected_lines - 1 do
--       selected_lines[i] = selected_lines[i]
--     end
--   else
--     -- If it's just a single line, slice the selected range based on column
--     selected_lines[1] = selected_lines[1]:sub(start_col + 1, end_col)
--   end
--
--   -- Join all lines into a single string
--   local text = table.concat(selected_lines, '\n')
--
--   -- If no text is selected, notify the user and return
--   if text == '' then
--     vim.notify('Nothing selected to replace', vim.log.levels.WARN)
--     return
--   end
--
--   -- Debugging: Check selected text
--   vim.notify(string.format('Selected text: %s', text))
--
--   -- Prompt for the case-insensitive toggle
--   vim.ui.select({ 'Yes', 'No' }, {
--     prompt = 'Enable case-insensitive search?',
--   }, function(choice)
--     local case_insensitive = (choice == 'Yes')
--
--     -- Prompt for the Lua pattern
--     vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--       if not pattern or pattern == '' then
--         return
--       end
--
--       -- Debugging: Check pattern
--       vim.notify(string.format('Pattern: %s', pattern))
--
--       -- Prompt for the replacement text
--       vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--         if replacement == nil then
--           return
--         end
--
--         -- Handle case-insensitivity: convert both pattern and selected text to lowercase if needed
--         if case_insensitive then
--           pattern = pattern:lower() -- Convert pattern to lowercase
--           text = text:lower()       -- Convert selected text to lowercase
--         end
--
--         -- Perform the pattern replacement using Lua's gsub
--         local ok, replaced = pcall(function()
--           return text:gsub(pattern, replacement)
--         end)
--
--         -- If the replacement was successful, update the text in the buffer
--         if ok then
--           local replaced_lines = vim.split(replaced, '\n', { plain = true })
--           vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--           vim.notify('Visual selection replaced successfully', vim.log.levels.INFO)
--         else
--           vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--         end
--       end)
--     end)
--   end)
-- end, { desc = 'Search and Replace in Visual Selection with Case Toggle' })
--
--
--
--

-- vim.keymap.set('v', '<leader>sx', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local mode = vim.fn.mode()
--
--   -- Get the start and end positions of the visual selection
--   local pos1 = vim.fn.getpos "'<"
--   local pos2 = vim.fn.getpos "'>"
--
--   -- Convert to 0-based line and column indices
--   local l1, c1 = pos1[2] - 1, pos1[3] - 1
--   local l2, c2 = pos2[2] - 1, pos2[3] - 1
--
--   -- Debugging: print positions
--   vim.notify(string.format('Visual start: line %d, col %d', l1, c1))
--   vim.notify(string.format('Visual end: line %d, col %d', l2, c2))
--
--   -- Ensure the start line/column and end line/column are in the correct order
--   local start_line, start_col, end_line, end_col
--   if l1 < l2 or (l1 == l2 and c1 <= c2) then
--     start_line, start_col = l1, c1
--     end_line, end_col = l2, c2
--   else
--     start_line, start_col = l2, c2
--     end_line, end_col = l1, c1
--   end
--
--   -- If in character mode, we should include the end column (exclusive range)
--   if mode == 'v' then
--     end_col = end_col + 1
--   end
--
--   -- Clamp the end column to the line length to avoid going beyond the actual text
--   local end_line_text = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1] or ''
--   end_col = math.min(end_col, #end_line_text)
--
--   -- Handle multi-line selections: Get the text for the entire selection, adjusting columns as necessary
--   local selected_lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line + 1, false)
--
--   if start_line ~= end_line then
--     -- For the first line, take from start column to end of the line
--     selected_lines[1] = selected_lines[1]:sub(start_col + 1)
--
--     -- For the last line, take from beginning of the line to the end column
--     selected_lines[#selected_lines] = selected_lines[#selected_lines]:sub(1, end_col)
--
--     -- For lines in between, take the whole line
--     for i = 2, #selected_lines - 1 do
--       selected_lines[i] = selected_lines[i]
--     end
--   else
--     -- If it's a single line, slice based on column
--     selected_lines[1] = selected_lines[1]:sub(start_col + 1, end_col)
--   end
--
--   -- Join the selected lines into a single text string
--   local text = table.concat(selected_lines, '\n')
--
--   -- If no text is selected, notify the user and return
--   if text == '' then
--     vim.notify('Nothing selected to replace', vim.log.levels.WARN)
--     return
--   end
--
--   -- Debugging: Check selected text
--   vim.notify(string.format('Selected text: %s', text))
--
--   -- Prompt for the case-insensitive toggle
--   vim.ui.select({ 'Yes', 'No' }, {
--     prompt = 'Enable case-insensitive search?',
--   }, function(choice)
--     local case_insensitive = (choice == 'Yes')
--
--     -- Prompt for the Lua pattern
--     vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--       if not pattern or pattern == '' then
--         return
--       end
--
--       -- Debugging: Check pattern
--       vim.notify(string.format('Pattern: %s', pattern))
--
--       -- Prompt for the replacement text
--       vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--         if replacement == nil then
--           return
--         end
--
--         -- Handle case-insensitivity: convert both pattern and selected text to lowercase if needed
--         if case_insensitive then
--           pattern = pattern:lower() -- Convert pattern to lowercase
--           text = text:lower()       -- Convert selected text to lowercase
--         end
--
--         -- Perform the pattern replacement using Lua's gsub
--         local ok, replaced = pcall(function()
--           return text:gsub(pattern, replacement)
--         end)
--
--         -- If the replacement was successful, update the text in the buffer
--         if ok then
--           local replaced_lines = vim.split(replaced, '\n', { plain = true })
--           vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
--           vim.notify('Visual selection replaced successfully', vim.log.levels.INFO)
--         else
--           vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
--         end
--       end)
--     end)
--   end)
-- end, { desc = 'Search and Replace in Visual Selection with Case Toggle' })
--
--
--
--
--
-- vim.keymap.set('v', '<leader>sx', function()
--   -- Exit visual mode to finalize '< and '> marks
--   vim.cmd 'normal! <Esc>'
--
--   local bufnr = vim.api.nvim_get_current_buf()
--
--   -- Get visual selection range
--   local start_pos = vim.fn.getpos "'<"
--   local end_pos = vim.fn.getpos "'>"
--
--   local start_line = start_pos[2] - 1
--   local start_col = start_pos[3] - 1
--   local end_line = end_pos[2] - 1
--   local end_col = end_pos[3]
--
--   -- Fix order if selection was reversed
--   if start_line > end_line or (start_line == end_line and start_col > end_col) then
--     start_line, end_line = end_line, start_line
--     start_col, end_col = end_col, start_col
--   end
--
--   -- Get selected text
--   local selected = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
--   local text = table.concat(selected, '\n')
--
--   if text == '' then
--     vim.notify('Nothing selected to replace', vim.log.levels.WARN)
--     return
--   end
--
--   vim.ui.select({ 'Yes', 'No' }, { prompt = 'Enable case-insensitive search?' }, function(choice)
--     local case_insensitive = (choice == 'Yes')
--
--     vim.ui.input({ prompt = 'Lua Pattern to Search:' }, function(pattern)
--       if not pattern or pattern == '' then
--         return
--       end
--
--       vim.ui.input({ prompt = 'Replace With:' }, function(replacement)
--         if replacement == nil then
--           return
--         end
--
--         local text_to_search = case_insensitive and text:lower() or text
--         local pattern_to_use = case_insensitive and pattern:lower() or pattern
--
--         local ok, replaced = pcall(function()
--           return text_to_search:gsub(pattern_to_use, replacement)
--         end)
--
--         if not ok then
--           vim.notify('Invalid pattern!', vim.log.levels.ERROR)
--           return
--         end
--
--         local new_lines = vim.split(replaced, '\n', { plain = true })
--         vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, new_lines)
--         vim.notify('Replaced successfully!', vim.log.levels.INFO)
--       end)
--     end)
--   end)
-- end, { desc = 'Search/Replace in Visual Selection' })
--
--
--
--
vim.keymap.set('v', '<leader>sx', function()
  -- Exit visual mode so marks '< and '> are finalized
  vim.cmd 'normal! <Esc>'

  local bufnr = vim.api.nvim_get_current_buf()

  -- Get start and end positions from visual marks
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"

  local start_line = start_pos[2] - 1
  local start_col = start_pos[3] - 1
  local end_line = end_pos[2] - 1
  local end_col = end_pos[3]

  -- Correct reversed selection
  if start_line > end_line or (start_line == end_line and start_col > end_col) then
    start_line, end_line = end_line, start_line
    start_col, end_col = end_col, start_col
  end

  -- Clamp end_col (it may be MAX_INT in linewise selection)
  local last_line = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1] or ''
  end_col = math.min(end_col, #last_line)

  -- Get selected text
  local ok, selected = pcall(vim.api.nvim_buf_get_text, bufnr, start_line, start_col, end_line, end_col, {})
  if not ok or #selected == 0 then
    vim.notify('No valid selection', vim.log.levels.WARN)
    return
  end
  local original = table.concat(selected, '\n')

  -- Begin prompts
  vim.ui.select({ 'Yes', 'No' }, { prompt = 'Case-insensitive?' }, function(case_choice)
    local case_insensitive = case_choice == 'Yes'

    vim.ui.input({ prompt = 'Pattern to search (Lua):' }, function(pattern)
      if not pattern or pattern == '' then
        return
      end

      vim.ui.input({ prompt = 'Replace with:' }, function(replacement)
        if replacement == nil then
          return
        end

        local pattern_actual = case_insensitive and pattern:lower() or pattern
        local text_actual = case_insensitive and original:lower() or original

        local ok, replaced = pcall(function()
          return text_actual:gsub(pattern_actual, replacement)
        end)

        if not ok or not replaced then
          vim.notify('Invalid pattern or replace error', vim.log.levels.ERROR)
          return
        end

        -- Replace in buffer
        local new_lines = vim.split(replaced, '\n', { plain = true })
        vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, new_lines)
        vim.notify('Visual selection replaced!', vim.log.levels.INFO)
      end)
    end)
  end)
end, { desc = 'Search and Replace in Visual Selection' })

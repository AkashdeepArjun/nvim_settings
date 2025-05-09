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
vim.keymap.set('v', '<leader>sx', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local mode = vim.fn.mode()

  -- Get the start and end positions of the visual selection
  local pos1 = vim.fn.getpos "'<"
  local pos2 = vim.fn.getpos "'>"

  -- Convert to 0-based line and column indices
  local l1, c1 = pos1[2] - 1, pos1[3] - 1
  local l2, c2 = pos2[2] - 1, pos2[3] - 1

  -- Normalize the start and end positions
  -- Ensure start is always less than end (from top-to-bottom, left-to-right)
  local start_line, start_col, end_line, end_col
  if l1 < l2 or (l1 == l2 and c1 <= c2) then
    start_line, start_col = l1, c1
    end_line, end_col = l2, c2
  else
    start_line, start_col = l2, c2
    end_line, end_col = l1, c1
  end

  -- Handle visual character mode: end_col is exclusive, so include it
  if mode == 'v' then
    end_col = end_col + 1
  end

  -- Ensure left-to-right selection order even if the user selected right-to-left
  if start_line == end_line and start_col > end_col then
    -- Swap the columns for right-to-left selection
    start_col, end_col = end_col, start_col
  end

  -- Clamp end_col to the actual line length (don't go beyond the line's end)
  local end_line_text = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)[1] or ''
  end_col = math.min(end_col, #end_line_text)

  -- Get the selected text
  local selected = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
  local text = table.concat(selected, '\n')

  -- If no text is selected, notify the user and return
  if text == '' then
    vim.notify('Nothing selected to replace', vim.log.levels.WARN)
    return
  end

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

      -- Perform the pattern replacement using Lua's gsub
      local ok, replaced = pcall(function()
        return text:gsub(pattern, replacement)
      end)

      -- If the replacement was successful, update the text in the buffer
      if ok then
        local replaced_lines = vim.split(replaced, '\n', { plain = true })
        vim.api.nvim_buf_set_text(bufnr, start_line, start_col, end_line, end_col, replaced_lines)
      else
        vim.notify('Invalid Lua pattern or replacement!', vim.log.levels.ERROR)
      end
    end)
  end)
end, { desc = 'Regex-like Replace in Visual Selection (Handles All Directions)' })

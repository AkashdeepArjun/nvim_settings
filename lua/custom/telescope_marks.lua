-- ~/.config/nvim/lua/custom/telescope_buffer_marks.lua

local M = {}

function M.buffer_marks()
  local pickers = require 'telescope.pickers'
  local finders = require 'telescope.finders'
  local sorters = require 'telescope.sorters'
  local actions = require 'telescope.actions'
  local action_state = require 'telescope.actions.state'

  local marks = vim.fn.getmarklist '%'
  local entries = {}

  for _, mark in ipairs(marks) do
    -- Only include valid alphabetical marks in this buffer
    if mark.mark:match "'%a" and mark.pos[2] > 0 then
      local line = vim.fn.getline(mark.pos[2])
      table.insert(entries, {
        display = string.format("Mark '%s' on line %d: %s", mark.mark:sub(2), mark.pos[2], line),
        ordinal = mark.mark,
        lnum = mark.pos[2],
      })
    end
  end

  if vim.tbl_isempty(entries) then
    vim.notify('No marks in current buffer', vim.log.levels.INFO)
    return
  end

  pickers
    .new({}, {
      prompt_title = 'Buffer Marks',
      finder = finders.new_table {
        results = entries,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry.display,
            ordinal = entry.ordinal,
            lnum = entry.lnum,
          }
        end,
      },
      sorter = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          if selection and selection.lnum then
            vim.api.nvim_win_set_cursor(0, { selection.lnum, 0 })
          end
        end)
        return true
      end,
    })
    :find()
end

return M

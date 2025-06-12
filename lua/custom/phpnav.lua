local M = {}

-- Get project root
local function get_project_root()
  local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if vim.v.shell_error == 0 and git_root then
    return git_root
  end
  return vim.fn.getcwd()
end

-- Try file with fallback extensions

local function try_open_file(base_path)
  local extensions = { '', '.php', '.js', '.css' }

  for _, ext in ipairs(extensions) do
    local full_path = base_path

    -- Only append extension if base_path has no extension already
    if ext ~= '' and not full_path:match '%.[a-zA-Z0-9]+$' then
      full_path = base_path .. ext -- ext includes the dot (e.g., ".php")
    end

    if vim.fn.filereadable(full_path) == 1 then
      vim.cmd('edit ' .. full_path)
      return true
    end
  end

  print('❌ File not found: ' .. base_path)
  return false
end

function M.open_php_related_file()
  local line = vim.api.nvim_get_current_line()

  -- Match common require/include statements
  local expr = line:match 'require_once%s*(.-);' or line:match 'require%s*(.-);' or line:match 'include_once%s*(.-);' or
  line:match 'include%s*(.-);'

  -- Match BASE_URL expressions (both PHP strings and inline HTML)
  if not expr then
    expr = line:match '=+%s*BASE_URL%s*%.%s*[\'"](.-)[\'"]' -- $js = BASE_URL . 'assets/...'
        or line:match 'BASE_URL%s*%?>%s*["\']?(.-)["\'%?]+' -- <?=BASE_URL?>assets/... (quoted or not)
  end

  if not expr then
    print '⚠️ No matching path expression found.'
    return
  end

  local root = get_project_root()
  local path = ''

  -- Strip versioning or query params like ?v=xxx or ?t=timestamp
  expr = expr:gsub('%?[^&"\']+', '')

  -- Final cleanup of weird syntax bits
  expr = expr:gsub('[\'"()]', '')
  expr = expr:gsub('//+', '/')

  if line:find 'BASE_URL' then
    path = root .. '/src/' .. expr
  elseif line:find 'PROJECT_ROOT' then
    expr = expr:gsub('PROJECT_ROOT%s*%.%s*', '')
    path = root .. '/src/' .. expr
  else
    print '❓ Unrecognized base constant.'
    return
  end

  try_open_file(path)
end

-- function M.open_php_related_file()
--   local line = vim.api.nvim_get_current_line()
--
--   local expr = line:match 'require_once%s*(.-);'
--       or line:match 'require%s*(.-);'
--       or line:match 'include_once%s*(.-);'
--       or line:match 'include%s*(.-);'
--       or line:match '=+%s*BASE_URL%s*%.%s*[\'"](.-)[\'"]'
--
--   if not expr then
--     print '⚠️ No matching path expression found.'
--     return
--   end
--
--   local root = get_project_root()
--   local path = ''
--
--   if line:find 'BASE_URL' then
--     path = root .. '/src/' .. expr
--   elseif line:find 'PROJECT_ROOT' then
--     -- expr = expr:gsub('PROJECT_ROOT%s*%.%s*', '')
--
--     -- Remove ANY uppercase constant followed by dot (PHP-style)
--     expr = expr:gsub('%u[%u_]*%s*%.%s*', '')
--     path = root .. '/src' .. expr
--   else
--     print '❓ Unrecognized base constant.'
--     return
--   end
--
--   -- Cleanup path
--   -- path = path:gsub('%s*%.%s*', '') -- remove ` . `
--   -- path = path:gsub('//+', '/')
--   path = path:gsub('[\'"()]', '') -- remove quotes/parens
--   path = path:gsub('//+', '/')    -- normalize slashes
--
--   try_open_file(path)
-- end

return M

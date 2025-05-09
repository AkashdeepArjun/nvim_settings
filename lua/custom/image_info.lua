-- local M = {}
--
-- -- Function to get image info using ImageMagick's `identify`
-- local function get_image_info(path)
--   print('Fetching image info for: ' .. path)
--   local handle = io.popen("identify -format '%wx%h %x DPI' " .. vim.fn.shellescape(path))
--   if not handle then
--     return 'Could not retrieve image info'
--   end
--   local result = handle:read '*a'
--   handle:close()
--   print('Image info: ' .. result)
--   return result:gsub('\n', '')
-- end
--
-- -- Component function that adds image info to the Neo-tree item
-- function M.image_info_component(config, node, state)
--   if not node or not node.path then
--     return {}
--   end
--   print(node.path)
--   local ext = node.name:match '^.+(%..+)$'
--   if ext and ext:lower():match '^%.(png|jpe?g|svg)$' then
--     local info = get_image_info(node.path)
--     return {
--       {
--         text = '📐 ' .. info,
--         -- text = '🧪 test', -- just testing
--         highlight = 'Comment',
--       },
--     }
--   end
--   return {}
-- end
--
-- return M
--
local M = {}
local cache = {}

local function get_image_info(path)
  if cache[path] then
    return cache[path]
  end

  local cmd = string.format('identify -format "%%wx%%h, %%x x %%y DPI" "%s" 2>/dev/null', vim.fn.shellescape(path))
  local handle = io.popen(cmd)
  if not handle then
    return nil
  end
  local result = handle:read '*a'
  handle:close()

  result = result and result:gsub('\n', '') or nil
  cache[path] = result
  return result
end

function M.image_info_component(_, node)
  if not node or not node.path then
    return {}
  end

  local ext = node.name:match '^.+(%..+)$'
  if not ext or not ext:lower():match '%.(png|jpe?g|svg)$' then
    return {}
  end

  local info = get_image_info(node.path)
  return info and {
    {
      text = ' 󰋩 ' .. info,
      highlight = 'Comment',
    },
  } or {}
end

return M

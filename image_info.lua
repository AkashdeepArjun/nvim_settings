local M = {}

-- Function to get image info using ImageMagick's `identify`
local function get_image_info(path)
  print('Fetching image info for: ' .. path)
  local handle = io.popen("identify -format '%wx%h %x DPI' " .. vim.fn.shellescape(path))
  if not handle then
    return 'Could not retrieve image info'
  end
  local result = handle:read '*a'
  handle:close()
  print('Image info: ' .. result)
  return result:gsub('\n', '')
end

-- Component function that adds image info to the Neo-tree item
function M.image_info_component(config, node, state)
  if not node or not node.path then
    return {}
  end
  local ext = node.name:match '^.+(%..+)$'
  if ext and ext:lower():match '^%.(png|jpe?g|svg)$' then
    local info = get_image_info(node.path)
    return {
      {
        text = '📐 ' .. info,
        -- text = '🧪 test', -- just testing
        highlight = 'Comment',
      },
    }
  end
  return {}
end

return M

local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

vim.keymap.set({ 'i', 's' }, '<A-k>', function()
  if ls.expand_or_jumpable then
    ls.expand_or_jump()
  end
end)

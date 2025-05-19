local ls = require 'luasnip'
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local indent = require('luasnip.extras').indent
local l = require('luasnip.extras').lambda
local rep = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require 'luasnip.util.types'
local conds = require 'luasnip.extras.conditions'
local conds_expand = require 'luasnip.extras.conditions.expand'
local k = require('luasnip.nodes.key_indexer').new_key
local events = require 'luasnip.util.events'

ls.add_snippets('php', {
  s(
    'php_val',
    fmt(
      [[
<?=	{}	?>{}
]],
      { i(1, '//VALUE'), i(0) },
      { delimiters = '{}' }
    )
  ),
  s(
    'foe',
    fmt(
      [[
  <?php foreach(${} as ${}):?>
      {}
      {}
  <?php  endforeach; ?>
  {}

  ]],
      { i(1, 'array'), i(2, 'item'), i(3, 'TODO'), i(4, '//blabla'), i(0) },
      { delimiters = '{}' }
    )
  ),
  s(
    'ifc',
    fmt(
      [[
  <?php if{}:?>
    {}
    {}
  <?php endif;?>
  {}
    ]],
      { i(1, 'condition'), i(2, '//todo1'), i(3, '//todo'), i(0) },
      { delimiters = '{}' }
    )
  ),
}, { key = 'php_file' })

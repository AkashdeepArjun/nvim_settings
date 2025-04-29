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

ls.add_snippets('c', {
  s('ternc', {

    i(1, 'cond'),
    t '?',
    i(2, 'value1'),
    t ':',
    i(3, 'value2'),
    t ';',
  }),
  s('ds', {
    i(1),
    t 'struct',
    i(2, ' DataStructure'),
    t '*',
    i(3, 'reference'),
    t '=',
    i(4),
    t '(struct ',
    i(5, 'DataStructure'),
    t '*)',
    i(6),
    t 'malloc(sizeof(struct ',
    i(7, 'DataStructure'),
    t '*);',
  }),
  s('hf', {
    t '#ifndef ',
    i(1),
    t { '_H_INCLUDED', '', '' },
    i(2),
    t '#define ',
    f(function(args)
      return args[1]
    end, { 1 }),
    t { '_H_INCLUDED', '', '', '#endif' },
  }),
})

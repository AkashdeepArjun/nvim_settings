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
  s(
    'start',
    fmt(
      [[
#define EXIT_STATUS 0
#include<stdlib.h>
#include<stdio.h>

int main(){{

{}

return EXIT_STATUS;

}}



]],
      { i(1, '//TODO') },
      { delimeters = '{}', indent_string = [[	]] }
    )
  ),
}, { key = 'c' })

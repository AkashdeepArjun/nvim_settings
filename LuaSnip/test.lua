local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local isn = ls.indent_snippet_node
local sn = ls.snippet_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt
ls.add_snippets('lua', {

  s('hf', {
    t '#ifndef ',
    i(1),
    t { '_H_INCLUDED', '', '' },
    i(2),
    t '#define ',
    f(function(args)
      return args[1]
    end, { 1 }),
    t { '_H_INCLUDED', '', '', '#endiflol lmfao' },
  }),
  s('e1', fmt('just {node_ref}', { node_ref = i(1, 'potato here') })),
  s('e2', fmt('if({n1}) else({n2})', { n1 = i(1, 'condition'), n2 = i(2, 'alternative') })),
  s('e3', fmt([[<div class={} </div>]], { i(1, 'sampleclass') })),
  s('e4', fmt([[#include<{}>]], { i(1, 'potato.h') }, { delimiters = '{}' })),
  s('e5', fmt([[#include "{}"]], { i(1, 'custom_file.h') }, { delimiters = '{}' })),
  s('e6', fmt([[<{a}>{b}</{a}>]], { a = i(1, 'mytag'), b = i(2, 'content') }, { delimiters = '{}', repeat_duplicates = true })),
  s(
    'e7',
    fmt(
      [[line-1 no indent
        \tline-2 s space->
        \t\tline-3 4 space->        ]],
      {},
      { indent_string = [[\t]] }
    )
  ),
  s(
    'e8',
    fmt(
      [[
      <msg>
      line-1
    \tline-2
    \t\tline-3
    \t\t\tline-4


  ]],
      { msg = i(1, t 'the fuck!!') },
      { delimiters = '<>', indent_string = [[\t]] }
    )
  ),
  s(
    'e9',
    fmt(
      [[

      function <>(<>:<>):<>{

      \t\t\tlogichere

      \t\t\t<>

      \tlmfao

      }


  ]],
      -- { nam = i(1, 'name'), arg_name = i(2, 'param'), arg_type = i(3, 'poram_type'), r_type = c(4, { t 'int', t 'float' }), ret_val = i(5, 'ret') },
      { i(1, 'name'), i(2, 'arg_name'), i(3, 'arg_type'), i(4, 'ret_type'), i(5, 'dafuq') },
      -- {},
      { delimiters = '<>', indent_string = [[\t]] }
    )
  ),
})

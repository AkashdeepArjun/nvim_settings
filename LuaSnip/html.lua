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
local k = require('luasnip.nodes.key_indexer').new_key
local events = require 'luasnip.util.events'
local function reindent_callback()
  vim.schedule(function()
    vim.cmd 'normal! =='
  end)
end
-- ls.log.open()
ls.add_snippets('html', {
  s('jscr', {

    sn(2, {
      t '<script type="text/javascript" ',
      i(1, 'src="" '),
      i(0),
      t '/>',
    }),
  }),
  s(
    'php',
    fmt(
      [[
<?php

{}
?>

  ]],
      { i(1, '//TODO') },
      {
        delimiters = '{}',
        indent_string = [[\t]],
      }
    ),
    {
      --   callbacks = {
      --     [-1] = {
      --       [events.enter] = function()
      --         vim.defer_fn(function()
      --           vim.bo.indentexpr = ''
      --           vim.bo.smartindent = false
      --           vim.bo.autoindent = false
      --           vim.bo.copyindent = true
      --           vim.opt_local.formatoptions:remove { 't', 'q' }
      --         end, 0)
      --       end,
      --     },
      --   },
      -- [5] = {
      --   [1] = reindent_callback,
      -- },
    }
  ),
  s('ec', {
    i(1, 'echo '),
    i(2, { '"  "' }),
    t ';',
  }),
  s('vd', {

    t 'var_dump(',
    i(1, '$variable'),
    t ');',
  }),
  s('fnc', {

    t 'function ',
    i(1, 'name'),
    t '(',
    i(2, 'argument'),
    t ':',
    c(3, { t 'int', t 'float' }),
    i(4),
    t('{', '', '', '(return )', '', ''),
    i(5, '$result'),
  }),

  s({ trig = '(div*)(%n)', regTrig = true }, {
    i(1),
    f(function(args, snip)
      return 'captured snippet ' .. snip.captures[1]
    end, {}),
  }),

  s(
    'phpf',
    fmt(

      [[

      function <>(<>):<>{

      \t\t\tlogichere

      \t\t\t<> <>



      }
  ]],
      {
        i(1, 'name'),
        i(2, '$param'),
        c(3, { t 'int', t 'float' }),
        i(4, 'return'),
        f(function(args)
          return args[1]
        end, { 3 }),
      },
      { delimiters = '<>', indent_string = [[\t]] }
    )
  ),
  s(
    'if',
    fmt(
      [[

    if(<>){

    \t\t\t<>

    }


  ]],
      { i(1, '$condition'), i(2, 'logic') },
      { delimiters = '<>', indent_string = [[\t]] }
    )
  ),

  s(
    'cls',
    fmt(
      [[

  class (){

    var $();

    function __construct(){

            $this->()=$();

    }
  }
  ]],
      {
        i(1, 'class_name'),
        i(2, 'prop_name', { key = 'popat' }),
        d(3, function(args)
          return sn(nil, { t '($', i(1, args[1]), t ')' })
        end, k 'popat'),
        f(function(args)
          return args[1]
        end, { 2 }),
        f(function(args)
          return args[1]
        end, { 2 }),
      },
      { delimiters = '()', indent_string = [[\t]] }
    )
  ),
  s(
    'key_arr',
    fmt(
      [[

  ${} =array(
      {}=>{},
      {}=>{}

  );


  ]],
      { i(1, 'array_name'), r(2, 'key'), i(3, 'value1'), i(4, 'key2'), i(5, 'value2') },
      { delimiters = '{}', indent_string = [[\t]] }
    ),
    {
      stored = {
        ['key'] = i(1, 'key1'),
      },
    }
  ),

  s(
    'arr',
    fmt(
      [[

  ${} =[
      {}=>{},
      {}=>{}

  ];


  ]],
      { i(1, 'array_name'), i(2, 'key1'), i(3, 'value1'), i(4, 'key2'), i(5, 'value2') },
      { delimiters = '{}', indent_string = [[\t]] }
    )
  ),
  s(
    'func',
    fmt(
      [[

    function <name>(<arg_name>:<arg_type>):<ret_type>{


        return $<result>

    }


  ]],
      {
        name = i(1, 'fname'),
        arg_name = i(2, 'argument'),
        arg_type = i(3, 'arg_type'),
        ret_type = i(4, 'ret_type'),
        result = i(5, 'result'),
      },
      { delimiters = '<>', indent_string = [[\t]] }
    )
  ),

  s(
    'pa',
    fmt(
      [[

print_r($<ref>);

]],
      { ref = i(1, 'array_var') },
      { delimiters = '<>', indent_string = [[\t]] }
    )
  ),
  postfix('.br', {
    f(function(_, parent)
      return '[' .. parent.snippet.env.POSTFIX_MATCH .. ']'
    end, {}),
  }),

  postfix('brc', {

    f(function()
      return '{' .. parent.snippet.env.POSTFIX_MATCH .. '}'
    end, {}),
  }),
  -- s(
  --   { regTrig = true, wordTrig = false, trig = 'div%.(%a+)%*(%d)' },
  --   d(1, function(args, snip)
  --     local nodes = {}
  --     for id = 1, snip.captures[2] do
  --       nodes[id] = sn(id, { t "<div class='", i(1), t { snip.captures[1] .. "'>", '' }, i(2), t { '', '', '</div>', '' } })
  --     end
  --     nodes[snip.captures[2] + 1] = i(0)
  --     return sn(nil, nodes)
  --   end, {})
  -- ),

  s({ regTrig = true, wordTrig = false, trig = '(%w+)%.(%a+)%*(%d)' }, {
    d(1, function(_, snip)
      local tag = snip.captures[1]
      local class_name = snip.captures[2]
      local amount = snip.captures[3]
      local nodes = {}
      for id = 1, amount do
        local new_node = fmt(
          [[

      <{tag_start} class='{cname}'>
      {content}
      </{tag_end}>


      ]],
          { tag_start = t(tag), content = i(id, 'TODO'), tag_end = t(tag), cname = t(class_name) },
          { delimiters = '{}', indent_string = [[\t]] }
        )
        vim.list_extend(nodes, new_node)
      end

      return sn(nil, nodes)
    end),
  }),
  s({ regTrig = true, wordTrig = false, trig = '(%w+)%*(%d)' }, {
    d(1, function(_, snip)
      local tag = snip.captures[1]
      local amount = snip.captures[2]
      local nodes = {}
      for id = 1, amount do
        local new_node = fmt(
          [[

      <{tag_start} >
      {content}
      </{tag_end}>


      ]],
          { tag_start = t(tag), content = i(id, 'TODO'), tag_end = t(tag) },
          { delimiters = '{}', indent_string = [[\t]] }
        )
        vim.list_extend(nodes, new_node)
      end

      return sn(nil, nodes)
    end),
  }),
}, { key = 'html' })

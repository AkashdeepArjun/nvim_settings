let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +11 lua/plugins/lualine.lua
badd +349 LuaSnip/html.lua
badd +28 LuaSnip/all.lua
badd +26 lua/plugins/luasnip.lua
badd +1 lua/plugins/fzf.lua
badd +259 lua/plugins/lsp.lua
badd +1 lua/plugins/mini_surround.lua
badd +1 lua/plugins/misc.lua
badd +1 lua/plugins/muren.lua
badd +1 lua/plugins/nvim-planery.lua
badd +26 lua/plugins/neo-tree.lua
badd +35 lua/plugins/ccc.lua
badd +12 lua/plugins/color-highlight.lua
badd +1 lua/plugins/colortheme.lua
badd +1 lua/plugins/indent-blankline.lua
badd +14 test.html
badd +182 init.lua
badd +41 lua/core/options.lua
badd +25 lua/plugins/treesitter.lua
badd +14 lua/custom/php_toggle.lua
badd +1 health://
badd +620 lua/core/keymaps.lua
badd +1 lua/plugins/novice.lua
badd +2 lua/plugins/notify.lua
badd +9 lua/plugins/spectre.lua
badd +1 test.css
argglobal
%argdel
edit lua/core/keymaps.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
tcd ~/.config/nvim
argglobal
enew
file ~/.config/nvim/neo-tree\ filesystem\ \[1]
balt ~/.config/nvim/test.html
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
wincmd w
argglobal
balt ~/.config/nvim/init.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 620 - ((16 * winheight(0) + 15) / 31)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 620
normal! 014|
wincmd w
2wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

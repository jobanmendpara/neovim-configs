let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.dotfiles/nvim/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +3 ~/.dotfiles/nvim/.config/nvim/lua/plugins/mini.lua
badd +1 Session.vim
badd +42 lua/plugins/lsp/lsp-utils.lua
badd +81 lua/plugins/which-key.lua
badd +40 lua/plugins/lualine.lua
badd +11 lua/plugins/no-neck-pain.lua
badd +1 lua/plugins/outline.lua
badd +15 lua/plugins/flash.lua
badd +27 lua/plugins/telescope.lua
badd +28 lua/config/options.lua
badd +3 lua/plugins/trouble.lua
badd +1 lua/plugins/notify.lua
badd +6 lua/config/keymaps.lua
argglobal
%argdel
edit lua/plugins/which-key.lua
argglobal
balt lua/plugins/lsp/lsp-utils.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 81 - ((18 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 81
normal! 098|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=1
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

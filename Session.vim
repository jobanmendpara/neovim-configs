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
badd +138 ~/.dotfiles/nvim/.config/nvim/lua/plugins/mini.lua
badd +1 Session.vim
badd +57 lua/plugins/lsp/lsp-utils.lua
badd +22 lua/plugins/which-key.lua
badd +73 lua/plugins/lualine.lua
badd +11 lua/plugins/no-neck-pain.lua
badd +1 lua/plugins/outline.lua
badd +23 lua/plugins/flash.lua
badd +98 lua/plugins/telescope.lua
badd +9 lua/config/options.lua
badd +3 lua/plugins/trouble.lua
badd +10 lua/plugins/notify.lua
badd +30 lua/config/keymaps.lua
badd +1 no-neck-pain-left.no-neck-pain
badd +35 lua/plugins/lsp/init.lua
badd +67 ~/Developer/cardinalManagement/admin/src/views/Employees/Employees.vue
badd +1 ~/.dotfiles/nvim/.config/nvim/lua/plugins/buffalo.lua
badd +4 lua/plugins/grapple.lua
badd +1 lua/config/lazy.lua
badd +16 lua/plugins/bookmarks.lua
badd +4 lua/plugins/cutlass.lua
badd +5 lua/plugins/navigator.lua
badd +50 lua/plugins/cmp.lua
badd +19 lua/plugins/noice.lua
badd +2 lua/plugins/auto-save.lua
badd +9 init.lua
badd +8 lua/colorschemes/catppuccin.lua
badd +6 lua/colorschemes/tokyonight.lua
badd +4 lua/plugins/shade.lua
badd +3 lua/plugins/twilight.lua
badd +1 lua/config/autocmds.lua
badd +11 after/ftplugin/gdscript.lua
badd +1 lua/plugins/smart-splits.lua
badd +4 lua/plugins/fidget.lua
badd +9 lua/plugins/none-ls.lua
badd +4 lua/plugins/lsp-timeout.lua
argglobal
%argdel
edit lua/plugins/grapple.lua
argglobal
balt ~/.dotfiles/nvim/.config/nvim/lua/plugins/mini.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
let s:l = 4 - ((3 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 020|
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

let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <expr> <Plug>delimitMateS-BS delimitMate#WithinEmptyPair() ? "\<Del>" : "\<S-BS>"
inoremap <silent> <Plug>delimitMateBS =delimitMate#BS()
nnoremap t :vertical term 
nnoremap K i
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nnoremap <silent> <F3> :CtrlP
nnoremap <SNR>17_: :=v:count ? v:count : ''
map <F4> : VimtexTocOpen
nnoremap <C-Left> gT
nnoremap <C-Right> gT
map <F2> : NERDTreeToggle
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set errorfile=~/Documents/AIMaster/Curso/TFM/Master-Thesis/thesis/Thesis.blg
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Ubuntu\ Mono\ derivative\ Powerline:8
set helplang=en
set hlsearch
set incsearch
set langnoremap
set nolangremap
set laststatus=2
set mouse=n
set pyxversion=2
set ruler
set runtimepath=~/.vim,~/.vim/bundle/Vundle.vim,~/.vim/bundle/vim-fugitive,~/.vim/bundle/nerdtree,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/delimitMate,~/.vim/bundle/vim-monokai,~/.vim/bundle/vim-javascript,~/.vim/bundle/powerline/powerline/bindings/vim/,~/.vim/bundle/vim-cpp-enhanced-highlight,~/.vim/bundle/vimtex,~/.vim/bundle/pydiction,~/.vim/bundle/vim-javascript-lib,~/.vim/bundle/AutoComplPop,~/.vim/bundle/vim-repl,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,~/.vim/after,~/.vim/bundle/Vundle.vim,~/.vim/bundle/Vundle.vim/after,~/.vim/bundle/vim-fugitive/after,~/.vim/bundle/nerdtree/after,~/.vim/bundle/ctrlp.vim/after,~/.vim/bundle/delimitMate/after,~/.vim/bundle/vim-monokai/after,~/.vim/bundle/vim-javascript/after,~/.vim/bundle/powerline/powerline/bindings/vim//after,~/.vim/bundle/vim-cpp-enhanced-highlight/after,~/.vim/bundle/vimtex/after,~/.vim/bundle/pydiction/after,~/.vim/bundle/vim-javascript-lib/after,~/.vim/bundle/AutoComplPop/after,~/.vim/bundle/vim-repl/after
set shiftwidth=2
set showcmd
set softtabstop=2
set splitbelow
set splitright
set statusline=%!pyeval('powerline.new_window()')
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg,.sty,.cls,.fdb_latexmk,.fls,.pdf,.synctex.gz
set tabline=%!pyeval('powerline.tabline()')
set termencoding=utf-8
set undodir=~/.vim/undo//
set undofile
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Documents/AIMaster/Curso/TFM/Master-Thesis/thesis
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 Thesis.tex
argglobal
silent! argdel *
$argadd Thesis.tex
edit Thesis.tex
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe '1resize ' . ((&lines * 43 + 28) / 56)
exe 'vert 1resize ' . ((&columns * 179 + 119) / 238)
exe '2resize ' . ((&lines * 21 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 58 + 119) / 238)
exe '3resize ' . ((&lines * 21 + 28) / 56)
exe 'vert 3resize ' . ((&columns * 58 + 119) / 238)
exe '4resize ' . ((&lines * 10 + 28) / 56)
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <S-Tab> <Plug>delimitMateS-Tab
imap <buffer> <S-BS> <Plug>delimitMateS-BS
imap <buffer> <BS> <Plug>delimitMateBS
imap <buffer> <silent> <F7> <Plug>(vimtex-cmd-create)
inoremap <buffer> <silent> <Plug>(vimtex-delim-close) =vimtex#delim#close()
inoremap <buffer> <silent> <Plug>(vimtex-cmd-create) =vimtex#cmd#create_insert()
omap <buffer> <silent> % <Plug>(vimtex-%)
xmap <buffer> <silent> % <Plug>(vimtex-%)
nmap <buffer> <silent> % <Plug>(vimtex-%)
omap <buffer> <silent> [[ <Plug>(vimtex-[[)
omap <buffer> <silent> [] <Plug>(vimtex-[])
xmap <buffer> <silent> [[ <Plug>(vimtex-[[)
xmap <buffer> <silent> [] <Plug>(vimtex-[])
nmap <buffer> <silent> [[ <Plug>(vimtex-[[)
nmap <buffer> <silent> [] <Plug>(vimtex-[])
nmap <buffer> <silent> \lm <Plug>(vimtex-imaps-list)
nmap <buffer> <silent> \lv <Plug>(vimtex-view)
nmap <buffer> <silent> \lY <Plug>(vimtex-labels-toggle)
nmap <buffer> <silent> \ly <Plug>(vimtex-labels-open)
nmap <buffer> <silent> \lT <Plug>(vimtex-toc-toggle)
nmap <buffer> <silent> \lt <Plug>(vimtex-toc-open)
nmap <buffer> <silent> \lG <Plug>(vimtex-status-all)
nmap <buffer> <silent> \lg <Plug>(vimtex-status)
nmap <buffer> <silent> \lC <Plug>(vimtex-clean-full)
nmap <buffer> <silent> \lc <Plug>(vimtex-clean)
nmap <buffer> <silent> \le <Plug>(vimtex-errors)
nmap <buffer> <silent> \lK <Plug>(vimtex-stop-all)
nmap <buffer> <silent> \lk <Plug>(vimtex-stop)
xmap <buffer> <silent> \lL <Plug>(vimtex-compile-selected)
nmap <buffer> <silent> \lL <Plug>(vimtex-compile-selected)
nmap <buffer> <silent> \lo <Plug>(vimtex-compile-output)
nmap <buffer> <silent> \ll <Plug>(vimtex-compile)
nmap <buffer> <silent> \lq <Plug>(vimtex-log)
nmap <buffer> <silent> \ls <Plug>(vimtex-toggle-main)
nmap <buffer> <silent> \lX <Plug>(vimtex-reload-state)
nmap <buffer> <silent> \lx <Plug>(vimtex-reload)
nmap <buffer> <silent> \lI <Plug>(vimtex-info-full)
nmap <buffer> <silent> \li <Plug>(vimtex-info)
omap <buffer> <silent> ][ <Plug>(vimtex-][)
omap <buffer> <silent> ]] <Plug>(vimtex-]])
xmap <buffer> <silent> ][ <Plug>(vimtex-][)
xmap <buffer> <silent> ]] <Plug>(vimtex-]])
nmap <buffer> <silent> ][ <Plug>(vimtex-][)
nmap <buffer> <silent> ]] <Plug>(vimtex-]])
omap <buffer> <silent> aP <Plug>(vimtex-aP)
xmap <buffer> <silent> aP <Plug>(vimtex-aP)
omap <buffer> <silent> a$ <Plug>(vimtex-a$)
xmap <buffer> <silent> a$ <Plug>(vimtex-a$)
omap <buffer> <silent> ae <Plug>(vimtex-ae)
xmap <buffer> <silent> ae <Plug>(vimtex-ae)
omap <buffer> <silent> ad <Plug>(vimtex-ad)
xmap <buffer> <silent> ad <Plug>(vimtex-ad)
omap <buffer> <silent> ac <Plug>(vimtex-ac)
xmap <buffer> <silent> ac <Plug>(vimtex-ac)
nmap <buffer> <silent> csd <Plug>(vimtex-delim-change-math)
nmap <buffer> <silent> csc <Plug>(vimtex-cmd-change)
nmap <buffer> <silent> cse <Plug>(vimtex-env-change)
nmap <buffer> <silent> cs$ <Plug>(vimtex-env-change-math)
nmap <buffer> <silent> dsd <Plug>(vimtex-delim-delete)
nmap <buffer> <silent> dsc <Plug>(vimtex-cmd-delete)
nmap <buffer> <silent> dse <Plug>(vimtex-env-delete)
nmap <buffer> <silent> ds$ <Plug>(vimtex-env-delete-math)
omap <buffer> <silent> iP <Plug>(vimtex-iP)
xmap <buffer> <silent> iP <Plug>(vimtex-iP)
omap <buffer> <silent> i$ <Plug>(vimtex-i$)
xmap <buffer> <silent> i$ <Plug>(vimtex-i$)
omap <buffer> <silent> ie <Plug>(vimtex-ie)
xmap <buffer> <silent> ie <Plug>(vimtex-ie)
omap <buffer> <silent> id <Plug>(vimtex-id)
xmap <buffer> <silent> id <Plug>(vimtex-id)
omap <buffer> <silent> ic <Plug>(vimtex-ic)
xmap <buffer> <silent> ic <Plug>(vimtex-ic)
xmap <buffer> <silent> tsD <Plug>(vimtex-delim-toggle-modifier-reverse)
nmap <buffer> <silent> tsD <Plug>(vimtex-delim-toggle-modifier-reverse)
xmap <buffer> <silent> tsd <Plug>(vimtex-delim-toggle-modifier)
nmap <buffer> <silent> tsd <Plug>(vimtex-delim-toggle-modifier)
nmap <buffer> <silent> tsc <Plug>(vimtex-cmd-toggle-star)
nmap <buffer> <silent> tse <Plug>(vimtex-env-toggle-star)
xmap <buffer> <silent> <F7> <Plug>(vimtex-cmd-create)
nmap <buffer> <silent> <F7> <Plug>(vimtex-cmd-create)
nnoremap <buffer> <Plug>(vimtex-view) :call b:vimtex.viewer.view('')
nnoremap <buffer> <Plug>(vimtex-toc-toggle) :call b:vimtex.toc.toggle()
nnoremap <buffer> <Plug>(vimtex-toc-open) :call b:vimtex.toc.open()
onoremap <buffer> <silent> <Plug>(vimtex-aP) :call vimtex#text_obj#sections(0, 0)
onoremap <buffer> <silent> <Plug>(vimtex-iP) :call vimtex#text_obj#sections(1, 0)
xnoremap <buffer> <silent> <Plug>(vimtex-aP) :call vimtex#text_obj#sections(0, 1)
xnoremap <buffer> <silent> <Plug>(vimtex-iP) :call vimtex#text_obj#sections(1, 1)
onoremap <buffer> <silent> <Plug>(vimtex-a$) :call vimtex#text_obj#delimited(0, 0,'env_math')
onoremap <buffer> <silent> <Plug>(vimtex-i$) :call vimtex#text_obj#delimited(1, 0,'env_math')
xnoremap <buffer> <silent> <Plug>(vimtex-a$) :call vimtex#text_obj#delimited(0, 1,'env_math')
xnoremap <buffer> <silent> <Plug>(vimtex-i$) :call vimtex#text_obj#delimited(1, 1,'env_math')
onoremap <buffer> <silent> <Plug>(vimtex-ae) :call vimtex#text_obj#delimited(0, 0,'env_tex')
onoremap <buffer> <silent> <Plug>(vimtex-ie) :call vimtex#text_obj#delimited(1, 0,'env_tex')
xnoremap <buffer> <silent> <Plug>(vimtex-ae) :call vimtex#text_obj#delimited(0, 1,'env_tex')
xnoremap <buffer> <silent> <Plug>(vimtex-ie) :call vimtex#text_obj#delimited(1, 1,'env_tex')
onoremap <buffer> <silent> <Plug>(vimtex-ad) :call vimtex#text_obj#delimited(0, 0,'delim_all')
onoremap <buffer> <silent> <Plug>(vimtex-id) :call vimtex#text_obj#delimited(1, 0,'delim_all')
xnoremap <buffer> <silent> <Plug>(vimtex-ad) :call vimtex#text_obj#delimited(0, 1,'delim_all')
xnoremap <buffer> <silent> <Plug>(vimtex-id) :call vimtex#text_obj#delimited(1, 1,'delim_all')
onoremap <buffer> <silent> <Plug>(vimtex-ac) :call vimtex#text_obj#commands(0, 0)
onoremap <buffer> <silent> <Plug>(vimtex-ic) :call vimtex#text_obj#commands(1, 0)
xnoremap <buffer> <silent> <Plug>(vimtex-ac) :call vimtex#text_obj#commands(0, 1)
xnoremap <buffer> <silent> <Plug>(vimtex-ic) :call vimtex#text_obj#commands(1, 1)
nnoremap <buffer> <Plug>(vimtex-reload-state) :VimtexReloadState
nnoremap <buffer> <Plug>(vimtex-toggle-main) :VimtexToggleMain
nnoremap <buffer> <Plug>(vimtex-errors) :call vimtex#qf#toggle()
xnoremap <buffer> <silent> <SNR>106_(vimtex-[[) :call vimtex#motion#next_section(0,1,1)
xnoremap <buffer> <silent> <SNR>106_(vimtex-[]) :call vimtex#motion#next_section(1,1,1)
xnoremap <buffer> <silent> <SNR>106_(vimtex-][) :call vimtex#motion#next_section(1,0,1)
xnoremap <buffer> <silent> <SNR>106_(vimtex-]]) :call vimtex#motion#next_section(0,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[[) :call vimtex#motion#next_section(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[]) :call vimtex#motion#next_section(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-][) :call vimtex#motion#next_section(1,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]]) :call vimtex#motion#next_section(0,0,0)
xnoremap <buffer> <silent> <SNR>106_(vimtex-%) :call vimtex#motion#find_matching_pair(1)
nnoremap <buffer> <silent> <Plug>(vimtex-%) :call vimtex#motion#find_matching_pair()
nnoremap <buffer> <SNR>106_(V) V
nnoremap <buffer> <SNR>106_(v) v
nnoremap <buffer> <Plug>(vimtex-reload) :VimtexReload
nnoremap <buffer> <Plug>(vimtex-log) :VimtexLog
nnoremap <buffer> <Plug>(vimtex-labels-toggle) :call b:vimtex.labels.toggle()
nnoremap <buffer> <Plug>(vimtex-labels-open) :call b:vimtex.labels.open()
nnoremap <buffer> <Plug>(vimtex-info-full) :VimtexInfo!
nnoremap <buffer> <Plug>(vimtex-info) :VimtexInfo
nnoremap <buffer> <Plug>(vimtex-imaps-list) :call vimtex#imaps#list()
nnoremap <buffer> <silent> <Plug>(vimtex-env-toggle-star) :call vimtex#env#toggle_star()
nnoremap <buffer> <silent> <Plug>(vimtex-env-change-math) :call vimtex#env#change_prompt('env_math')
nnoremap <buffer> <silent> <Plug>(vimtex-env-delete-math) :call vimtex#env#delete('env_math')
nnoremap <buffer> <silent> <Plug>(vimtex-env-change) :call vimtex#env#change_prompt('env_tex')
nnoremap <buffer> <silent> <Plug>(vimtex-env-delete) :call vimtex#env#delete('env_tex')
nnoremap <buffer> <Plug>(vimtex-doc-package) :VimtexDocPackage
nnoremap <buffer> <silent> <Plug>(vimtex-delim-delete) :call vimtex#delim#delete()
nnoremap <buffer> <silent> <Plug>(vimtex-delim-change-math) :call vimtex#delim#change_prompt()
xnoremap <buffer> <silent> <Plug>(vimtex-delim-toggle-modifier-reverse) :call vimtex#delim#toggle_modifier_visual({'dir': -1})
xnoremap <buffer> <silent> <Plug>(vimtex-delim-toggle-modifier) :call vimtex#delim#toggle_modifier_visual()
nnoremap <buffer> <silent> <Plug>(vimtex-delim-toggle-modifier-reverse) :call vimtex#delim#toggle_modifier({'dir': -1})
nnoremap <buffer> <silent> <Plug>(vimtex-delim-toggle-modifier) :call vimtex#delim#toggle_modifier()
nnoremap <buffer> <Plug>(vimtex-status-all) :call vimtex#compiler#status(1)
nnoremap <buffer> <Plug>(vimtex-status) :call vimtex#compiler#status(0)
nnoremap <buffer> <Plug>(vimtex-clean-full) :call vimtex#compiler#clean(1)
nnoremap <buffer> <Plug>(vimtex-clean) :call vimtex#compiler#clean(0)
nnoremap <buffer> <Plug>(vimtex-stop-all) :call vimtex#compiler#stop_all()
nnoremap <buffer> <Plug>(vimtex-stop) :call vimtex#compiler#stop()
nnoremap <buffer> <Plug>(vimtex-compile-output) :call vimtex#compiler#output()
xnoremap <buffer> <Plug>(vimtex-compile-selected) :call vimtex#compiler#compile_selected('visual')
nnoremap <buffer> <Plug>(vimtex-compile-selected) :set opfunc=vimtex#compiler#compile_selectedg@
nnoremap <buffer> <Plug>(vimtex-compile-ss) :call vimtex#compiler#compile_ss()
nnoremap <buffer> <Plug>(vimtex-compile) :call vimtex#compiler#compile()
nnoremap <buffer> <silent> <Plug>(vimtex-cmd-toggle-star) :call vimtex#cmd#toggle_star()
xnoremap <buffer> <silent> <Plug>(vimtex-cmd-create) :call vimtex#cmd#create_ask(1)
nnoremap <buffer> <silent> <Plug>(vimtex-cmd-create) :call vimtex#cmd#create_ask(0)
nnoremap <buffer> <silent> <Plug>(vimtex-cmd-change) :call vimtex#cmd#change()
nnoremap <buffer> <silent> <Plug>(vimtex-cmd-delete) :call vimtex#cmd#delete()
imap <buffer> <silent> g <Plug>delimitMateJumpMany
imap <buffer>  <Plug>delimitMateBS
imap <buffer> " <Plug>delimitMate"
imap <buffer> ' <Plug>delimitMate'
imap <buffer> ( <Plug>delimitMate(
imap <buffer> ) <Plug>delimitMate)
imap <buffer> [ <Plug>delimitMate[
imap <buffer> ] <Plug>delimitMate]
imap <buffer> <silent> ]] <Plug>(vimtex-delim-close)
imap <buffer> ` <Plug>delimitMate`
inoremap <buffer> <silent> <expr> `vr vimtex#imaps#wrap_math("`vr", '\varrho')
inoremap <buffer> <silent> <expr> `vq vimtex#imaps#wrap_math("`vq", '\vartheta')
inoremap <buffer> <silent> <expr> `vk vimtex#imaps#wrap_math("`vk", '\varkappa')
inoremap <buffer> <silent> <expr> `vf vimtex#imaps#wrap_math("`vf", '\varphi')
inoremap <buffer> <silent> <expr> `ve vimtex#imaps#wrap_math("`ve", '\varepsilon')
inoremap <buffer> <silent> <expr> `Y vimtex#imaps#wrap_math("`Y", '\Psi')
inoremap <buffer> <silent> <expr> `X vimtex#imaps#wrap_math("`X", '\Xi')
inoremap <buffer> <silent> <expr> `W vimtex#imaps#wrap_math("`W", '\Omega')
inoremap <buffer> <silent> <expr> `U vimtex#imaps#wrap_math("`U", '\Upsilon')
inoremap <buffer> <silent> <expr> `S vimtex#imaps#wrap_math("`S", '\Sigma')
inoremap <buffer> <silent> <expr> `Q vimtex#imaps#wrap_math("`Q", '\Theta')
inoremap <buffer> <silent> <expr> `P vimtex#imaps#wrap_math("`P", '\Pi')
inoremap <buffer> <silent> <expr> `L vimtex#imaps#wrap_math("`L", '\Lambda')
inoremap <buffer> <silent> <expr> `F vimtex#imaps#wrap_math("`F", '\Phi')
inoremap <buffer> <silent> <expr> `D vimtex#imaps#wrap_math("`D", '\Delta')
inoremap <buffer> <silent> <expr> `G vimtex#imaps#wrap_math("`G", '\Gamma')
inoremap <buffer> <silent> <expr> `x vimtex#imaps#wrap_math("`x", '\xi')
inoremap <buffer> <silent> <expr> `z vimtex#imaps#wrap_math("`z", '\zeta')
inoremap <buffer> <silent> <expr> `w vimtex#imaps#wrap_math("`w", '\omega')
inoremap <buffer> <silent> <expr> `u vimtex#imaps#wrap_math("`u", '\upsilon')
inoremap <buffer> <silent> <expr> `y vimtex#imaps#wrap_math("`y", '\psi')
inoremap <buffer> <silent> <expr> `t vimtex#imaps#wrap_math("`t", '\tau')
inoremap <buffer> <silent> <expr> `s vimtex#imaps#wrap_math("`s", '\sigma')
inoremap <buffer> <silent> <expr> `r vimtex#imaps#wrap_math("`r", '\rho')
inoremap <buffer> <silent> <expr> `q vimtex#imaps#wrap_math("`q", '\theta')
inoremap <buffer> <silent> <expr> `p vimtex#imaps#wrap_math("`p", '\pi')
inoremap <buffer> <silent> <expr> `n vimtex#imaps#wrap_math("`n", '\nu')
inoremap <buffer> <silent> <expr> `m vimtex#imaps#wrap_math("`m", '\mu')
inoremap <buffer> <silent> <expr> `l vimtex#imaps#wrap_math("`l", '\lambda')
inoremap <buffer> <silent> <expr> `k vimtex#imaps#wrap_math("`k", '\kappa')
inoremap <buffer> <silent> <expr> `i vimtex#imaps#wrap_math("`i", '\iota')
inoremap <buffer> <silent> <expr> `h vimtex#imaps#wrap_math("`h", '\eta')
inoremap <buffer> <silent> <expr> `g vimtex#imaps#wrap_math("`g", '\gamma')
inoremap <buffer> <silent> <expr> `f vimtex#imaps#wrap_math("`f", '\phi')
inoremap <buffer> <silent> <expr> `e vimtex#imaps#wrap_math("`e", '\epsilon')
inoremap <buffer> <silent> <expr> `d vimtex#imaps#wrap_math("`d", '\delta')
inoremap <buffer> <silent> <expr> `c vimtex#imaps#wrap_math("`c", '\chi')
inoremap <buffer> <silent> <expr> `b vimtex#imaps#wrap_math("`b", '\beta')
inoremap <buffer> <silent> <expr> `a vimtex#imaps#wrap_math("`a", '\alpha')
inoremap <buffer> <silent> <expr> `jL vimtex#imaps#wrap_math("`jL", '\Rightarrow')
inoremap <buffer> <silent> <expr> `jl vimtex#imaps#wrap_math("`jl", '\rightarrow')
inoremap <buffer> <silent> <expr> `jH vimtex#imaps#wrap_math("`jH", '\Leftarrow')
inoremap <buffer> <silent> <expr> `jh vimtex#imaps#wrap_math("`jh", '\leftarrow')
inoremap <buffer> <silent> <expr> `jK vimtex#imaps#wrap_math("`jK", '\Uparrow')
inoremap <buffer> <silent> <expr> `jk vimtex#imaps#wrap_math("`jk", '\uparrow')
inoremap <buffer> <silent> <expr> `jJ vimtex#imaps#wrap_math("`jJ", '\Downarrow')
inoremap <buffer> <silent> <expr> `jj vimtex#imaps#wrap_math("`jj", '\downarrow')
inoremap <buffer> <silent> <expr> `E vimtex#imaps#wrap_math("`E", '\exists')
inoremap <buffer> <silent> <expr> `A vimtex#imaps#wrap_math("`A", '\forall')
inoremap <buffer> <silent> <expr> `) vimtex#imaps#wrap_math("`)", '\supset')
inoremap <buffer> <silent> <expr> `( vimtex#imaps#wrap_math("`(", '\subset')
inoremap <buffer> <silent> <expr> `] vimtex#imaps#wrap_math("`]", '\supseteq')
inoremap <buffer> <silent> <expr> `[ vimtex#imaps#wrap_math("`[", '\subseteq')
inoremap <buffer> <silent> <expr> `> vimtex#imaps#wrap_math("`>", '\rangle')
inoremap <buffer> <silent> <expr> `< vimtex#imaps#wrap_math("`<", '\langle')
inoremap <buffer> <silent> <expr> `* vimtex#imaps#wrap_math("`*", '\times')
inoremap <buffer> <silent> <expr> `. vimtex#imaps#wrap_math("`.", '\cdot')
inoremap <buffer> <silent> <expr> `\ vimtex#imaps#wrap_math("`\\", '\setminus')
inoremap <buffer> <silent> <expr> `= vimtex#imaps#wrap_math("`=", '\equiv')
inoremap <buffer> <silent> <expr> `8 vimtex#imaps#wrap_math("`8", '\infty')
inoremap <buffer> <silent> <expr> `6 vimtex#imaps#wrap_math("`6", '\partial')
inoremap <buffer> <silent> <expr> `0 vimtex#imaps#wrap_math("`0", '\emptyset')
imap <buffer> { <Plug>delimitMate{
imap <buffer> } <Plug>delimitMate}
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:%\ -,mO:%\ \ ,eO:%%,:%
setlocal commentstring=%%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=\\\\\\([egx]\\|char\\|mathchar\\|count\\|dimen\\|muskip\\|skip\\|toks\\)\\=def\\|\\\\font\\|\\\\\\(future\\)\\=let\\|\\\\new\\(count\\|dimen\\|skip\\|muskip\\|box\\|toks\\|read\\|write\\|fam\\|insert\\)\\|\\\\\\(re\\)\\=new\\(boolean\\|command\\|counter\\|environment\\|font\\|if\\|length\\|savebox\\|theorem\\(style\\)\\=\\)\\s*\\*\\=\\s*{\\=\\|DeclareMathOperator\\s*{\\=\\s*
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%-P**%f,%-P**\"%f\",%E!\ LaTeX\ %trror:\ %m,%E%f:%l:\ %m,%E!\ %m,%Z<argument>\ %m,%Cl.%l\ %m,%+WLaTeX\ Font\ Warning:\ %.%#line\ %l%.%#,%-CLaTeX\ Font\ Warning:\ %m,%-C(Font)%m,%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,%+WLaTeX\ %.%#Warning:\ %m,%+WOverfull\ %\\%\\hbox%.%#\ at\ lines\ %l--%*\\d,%+WUnderfull\ %\\%\\hbox%.%#\ at\ lines\ %l--%*\\d,%+WPackage\ natbib\ Warning:\ %m\ on\ input\ line\ %l%.,%+WPackage\ biblatex\ Warning:\ %m,%-C(biblatex)%.%#in\ t%.%#,%-C(biblatex)%.%#Please\ v%.%#,%-C(biblatex)%.%#LaTeX\ a%.%#,%-C(biblatex)%m,%-Z(babel)%.%#input\ line\ %l.,%-C(babel)%m,%+WPackage\ hyperref\ Warning:\ %m,%-C(hyperref)%.%#on\ input\ line\ %l.,%-C(hyperref)%m,%+WPackage\ scrreprt\ Warning:\ %m,%-C(scrreprt)%m,%+WPackage\ fixltx2e\ Warning:\ %m,%-C(fixltx2e)%m,%+WPackage\ titlesec\ Warning:\ %m,%-C(titlesec)%m,%-G%.%#
setlocal expandtab
if &filetype != 'tex'
setlocal filetype=tex
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=\\v%(\\v\\\\%(input|include|subfile)\\s*\\{|\\v\\\\%(sub)?%(import|%(input|include)from)\\*?\\{[^\\}]*\\}\\{)
setlocal includeexpr=vimtex#include#expr()
setlocal indentexpr=VimtexIndentExpr()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,[,(,{,),},],&,=item
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=vimtex#complete#omnifunc
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!pyeval('powerline.statusline(1)')
setlocal suffixesadd=.tex,.sty,.cls
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'tex'
setlocal syntax=tex
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 1 - ((0 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Documents/AIMaster/Curso/TFM/Master-Thesis/thesis
wincmd w
argglobal
terminal ++curwin ++cols=58 ++rows=21 
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <S-Tab> <Plug>delimitMateS-Tab
imap <buffer> <S-BS> <Plug>delimitMateS-BS
imap <buffer> <BS> <Plug>delimitMateBS
imap <buffer> <silent> g <Plug>delimitMateJumpMany
imap <buffer>  <Plug>delimitMateBS
imap <buffer> " <Plug>delimitMate"
imap <buffer> ' <Plug>delimitMate'
imap <buffer> ( <Plug>delimitMate(
imap <buffer> ) <Plug>delimitMate)
imap <buffer> [ <Plug>delimitMate[
imap <buffer> ] <Plug>delimitMate]
imap <buffer> ` <Plug>delimitMate`
imap <buffer> { <Plug>delimitMate{
imap <buffer> } <Plug>delimitMate}
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=terminal
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != ''
setlocal filetype=
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!pyeval('powerline.statusline(3)')
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 1 - ((0 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Documents/AIMaster/Curso/TFM/Master-Thesis/thesis
wincmd w
argglobal
terminal ++curwin ++cols=58 ++rows=21 
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <S-Tab> <Plug>delimitMateS-Tab
imap <buffer> <S-BS> <Plug>delimitMateS-BS
imap <buffer> <BS> <Plug>delimitMateBS
imap <buffer> <silent> g <Plug>delimitMateJumpMany
imap <buffer>  <Plug>delimitMateBS
imap <buffer> " <Plug>delimitMate"
imap <buffer> ' <Plug>delimitMate'
imap <buffer> ( <Plug>delimitMate(
imap <buffer> ) <Plug>delimitMate)
imap <buffer> [ <Plug>delimitMate[
imap <buffer> ] <Plug>delimitMate]
imap <buffer> ` <Plug>delimitMate`
imap <buffer> { <Plug>delimitMate{
imap <buffer> } <Plug>delimitMate}
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=terminal
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != ''
setlocal filetype=
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!pyeval('powerline.statusline(4)')
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 1 - ((0 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Documents/AIMaster/Curso/TFM/Master-Thesis/thesis
wincmd w
argglobal
enew
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <S-Tab> <Plug>delimitMateS-Tab
imap <buffer> <S-BS> <Plug>delimitMateS-BS
imap <buffer> <BS> <Plug>delimitMateBS
imap <buffer> <silent> g <Plug>delimitMateJumpMany
imap <buffer>  <Plug>delimitMateBS
imap <buffer> " <Plug>delimitMate"
imap <buffer> ' <Plug>delimitMate'
imap <buffer> ( <Plug>delimitMate(
imap <buffer> ) <Plug>delimitMate)
imap <buffer> [ <Plug>delimitMate[
imap <buffer> ] <Plug>delimitMate]
imap <buffer> ` <Plug>delimitMate`
imap <buffer> { <Plug>delimitMate{
imap <buffer> } <Plug>delimitMate}
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=wipe
setlocal buflisted
setlocal buftype=quickfix
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'qf'
setlocal filetype=qf
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!pyeval('powerline.statusline(2)')
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'qf'
setlocal syntax=qf
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal winfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
lcd ~/Documents/AIMaster/Curso/TFM/Master-Thesis/thesis
wincmd w
exe '1resize ' . ((&lines * 43 + 28) / 56)
exe 'vert 1resize ' . ((&columns * 179 + 119) / 238)
exe '2resize ' . ((&lines * 21 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 58 + 119) / 238)
exe '3resize ' . ((&lines * 21 + 28) / 56)
exe 'vert 3resize ' . ((&columns * 58 + 119) / 238)
exe '4resize ' . ((&lines * 10 + 28) / 56)
tabnext 1
if exists('s:wipebuf') && s:wipebuf != bufnr('%')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

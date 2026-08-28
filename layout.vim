vim9script
g:SessionLoad = 1
if &cp | set nocp | endif
var cpo_save: string
cpo_save = &cpo
set cpo&vim
inoremap <silent> <SNR>42_AutoPairsReturn =AutoPairsReturn()
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
legacy inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
legacy inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
legacy inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
legacy inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed 's:^..::'")
legacy inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print | sed '1d;s:^..::'")
legacy inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
inoremap <silent> <SNR>43_AutoPairsReturn =AutoPairsReturn()
nnoremap  :NERDTreeFind
nnoremap  :Rg
nnoremap  :NERDTreeToggle
nnoremap  :Files
nnoremap  :qa!
nnoremap  :w
nnoremap  :Windows
nnoremap \n :NERDTreeFocus
nnoremap \m :noh
nnoremap \t :tabe
xmap gx <Plug>(open-word-under-cursor)
nmap gx <Plug>(open-word-under-cursor)
nnoremap <silent> <Plug>(lsp-signature-help) :call lsp#ui#vim#signature_help#get_signature_help_under_cursor()
nnoremap <silent> <Plug>(lsp-document-link-open) :call lsp#ui#vim#document_link_open()
nnoremap <silent> <Plug>(lsp-document-link) :call lsp#ui#vim#document_link()
nnoremap <silent> <Plug>(lsp-previous-reference) :call lsp#internal#document_highlight#jump(-1)
nnoremap <silent> <Plug>(lsp-next-reference) :call lsp#internal#document_highlight#jump(+1)
nnoremap <silent> <Plug>(lsp-status) :echo lsp#get_server_status()
nnoremap <silent> <Plug>(lsp-peek-implementation) :call lsp#ui#vim#implementation(1)
nnoremap <silent> <Plug>(lsp-implementation) :call lsp#ui#vim#implementation(0)
xnoremap <silent> <Plug>(lsp-document-range-format) :<Home>silent <End>call lsp#internal#document_range_formatting#format({ 'bufnr': bufnr('%') })
nnoremap <silent> <Plug>(lsp-document-range-format) :set opfunc=lsp#internal#document_range_formatting#opfuncg@
vnoremap <silent> <Plug>(lsp-document-format) :<Home>silent <End>call lsp#internal#document_range_formatting#format({ 'bufnr': bufnr('%') })
nnoremap <silent> <Plug>(lsp-document-format) :call lsp#internal#document_formatting#format({ 'bufnr': bufnr('%') })
nnoremap <silent> <Plug>(lsp-workspace-symbol-search) :call lsp#internal#workspace_symbol#search#do({})
nnoremap <silent> <Plug>(lsp-workspace-symbol) :call lsp#ui#vim#workspace_symbol('')
nnoremap <silent> <Plug>(lsp-peek-type-definition) :call lsp#ui#vim#type_definition(1)
nnoremap <silent> <Plug>(lsp-type-hierarchy) :call lsp#internal#type_hierarchy#show()
nnoremap <silent> <Plug>(lsp-type-definition) :call lsp#ui#vim#type_definition(0)
nnoremap <silent> <Plug>(lsp-rename) :call lsp#ui#vim#rename({})
nnoremap <silent> <Plug>(lsp-references) :call lsp#ui#vim#references({})
nnoremap <silent> <Plug>(lsp-previous-diagnostic-nowrap) :call lsp#internal#diagnostics#movement#_previous_diagnostics("-wrap=0")
nnoremap <silent> <Plug>(lsp-previous-diagnostic) :call lsp#internal#diagnostics#movement#_previous_diagnostics()
nnoremap <silent> <Plug>(lsp-next-diagnostic-nowrap) :call lsp#internal#diagnostics#movement#_next_diagnostics("-wrap=0")
nnoremap <silent> <Plug>(lsp-next-diagnostic) :call lsp#internal#diagnostics#movement#_next_diagnostics()
nnoremap <silent> <Plug>(lsp-previous-warning-nowrap) :call lsp#internal#diagnostics#movement#_previous_warning("-wrap=0")
nnoremap <silent> <Plug>(lsp-previous-warning) :call lsp#internal#diagnostics#movement#_previous_warning()
nnoremap <silent> <Plug>(lsp-next-warning-nowrap) :call lsp#internal#diagnostics#movement#_next_warning("-wrap=0")
nnoremap <silent> <Plug>(lsp-next-warning) :call lsp#internal#diagnostics#movement#_next_warning()
nnoremap <silent> <Plug>(lsp-previous-error-nowrap) :call lsp#internal#diagnostics#movement#_previous_error("-wrap=0")
nnoremap <silent> <Plug>(lsp-previous-error) :call lsp#internal#diagnostics#movement#_previous_error()
nnoremap <silent> <Plug>(lsp-next-error-nowrap) :call lsp#internal#diagnostics#movement#_next_error("-wrap=0")
nnoremap <silent> <Plug>(lsp-next-error) :call lsp#internal#diagnostics#movement#_next_error()
nnoremap <silent> <Plug>(lsp-preview-focus) :call lsp#ui#vim#output#focuspreview()
nnoremap <silent> <Plug>(lsp-preview-close) :call lsp#ui#vim#output#closepreview()
nnoremap <silent> <Plug>(lsp-hover-preview) :call lsp#internal#document_hover#under_cursor#do({ 'ui': 'preview' })
nnoremap <silent> <Plug>(lsp-hover-float) :call lsp#internal#document_hover#under_cursor#do({ 'ui': 'float' })
nnoremap <silent> <Plug>(lsp-hover) :call lsp#internal#document_hover#under_cursor#do({})
nnoremap <silent> <Plug>(lsp-document-diagnostics) :call lsp#internal#diagnostics#document_diagnostics_command#do({})
nnoremap <silent> <Plug>(lsp-document-symbol-search) :call lsp#internal#document_symbol#search#do({})
nnoremap <silent> <Plug>(lsp-document-symbol) :call lsp#ui#vim#document_symbol()
nnoremap <silent> <Plug>(lsp-peek-definition) :call lsp#ui#vim#definition(1)
nnoremap <silent> <Plug>(lsp-definition) :call lsp#ui#vim#definition(0)
nnoremap <silent> <Plug>(lsp-peek-declaration) :call lsp#ui#vim#declaration(1)
nnoremap <silent> <Plug>(lsp-declaration) :call lsp#ui#vim#declaration(0)
nnoremap <silent> <Plug>(lsp-code-lens) :call lsp#ui#vim#code_lens()
nnoremap <silent> <Plug>(lsp-code-action-preview) :call lsp#ui#vim#code_action({ 'ui': 'preview' })
nnoremap <silent> <Plug>(lsp-code-action-float) :call lsp#ui#vim#code_action({ 'ui': 'float' })
nnoremap <silent> <Plug>(lsp-code-action) :call lsp#ui#vim#code_action({})
nnoremap <silent> <Plug>(lsp-call-hierarchy-outgoing) :call lsp#ui#vim#call_hierarchy_outgoing()
nnoremap <silent> <Plug>(lsp-call-hierarchy-incoming) :call lsp#ui#vim#call_hierarchy_incoming({})
nnoremap <C-T> :Windows
xnoremap <Plug>(open-word-under-cursor) <ScriptCmd>vim9.Open(getregion(getpos('v'), getpos('.'), { type: mode() })->join())
nnoremap <Plug>(open-word-under-cursor) <ScriptCmd>vim9.Open(GetWordUnderCursor())
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
tnoremap <silent> <Plug>(fzf-normal) 
tnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <Plug>(fzf-normal) <Nop>
nnoremap <silent> <Plug>(fzf-insert) i
tnoremap <F12>  :FloatermToggle
nnoremap <F12> :FloatermToggle
nnoremap <C-F> :NERDTreeFind
nnoremap <C-N> :NERDTreeToggle
nnoremap <M-Left> :tabprev
nnoremap <M-Right> :tabnext
nnoremap <C-Q> :qa!
nnoremap <C-S> :w
nnoremap <C-G> :Rg
nnoremap <C-P> :Files
&cpo = cpo_save
legacy set background=dark
legacy set backupdir=~/.cache/vim/backup//
legacy set directory=~/.cache/vim/swap//
legacy set fileencodings=ucs-bom,utf-8,default,latin1
legacy set helplang=en
set hlsearch
set laststatus=2
legacy set mouse=a
legacy set omnifunc=ccomplete#Complete
legacy set runtimepath=~/.vim,~/.vim/plugged/nerdtree,~/.vim/plugged/vim-floaterm,~/.vim/plugged/auto-pairs,~/.vim/plugged/vim-lsp,~/.vim/plugged/tagbar,~/.vim/plugged/vim-airline,~/.vim/plugged/fzf,~/.vim/plugged/fzf.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim92,/usr/share/vim/vim92/pack/dist/opt/netrw,/usr/share/vim/vimfiles/after,~/.vim/after
set shiftwidth=4
legacy set suffixes=.bak,~,.o,.info,.swp,.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set tabstop=4
set tags=~/.vim/system.tags,tags
legacy set undodir=~/.cache/vim/undo//
set window=69
set winminheight=0
set winminwidth=0
import autoload '/usr/share/vim/vim92/autoload/dist/ft.vim'
import autoload '/usr/share/vim/vim92/autoload/dist/script.vim'
import autoload '/usr/share/vim/vim92/autoload/dist/vim9.vim'
const so_save: number = &g:so | const siso_save: number = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
v:this_session = expand("<sfile>:p")
doautoall SessionLoadPre
var save_splitbelow: bool
var save_splitright: bool
var save_winminheight: number
var save_winminwidth: number
var wipebuf: number = -1
var shortmess_save: string
silent only
silent tabonly
cd ~/proj/schell
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  wipebuf = bufnr('%')
endif
set shortmess+=aoO
badd +1 main.c
badd +1 gui.c
badd +1 buck.c
badd +1 buck.h
badd +1 buffer.h
badd +1 buffer.c
badd +1 color.h
badd +1 makefile
badd +1 gui.h
badd +1 controls.h
badd +1 textbar.c
badd +1 textbar.h
badd +0 widgets.h
argglobal
:%argdel
:$argadd main.c
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit main.c
argglobal
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
legacy setlocal keymap=
setlocal noarabic
setlocal noautoindent
legacy setlocal backupcopy=
legacy setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
legacy setlocal breakindentopt=
legacy setlocal bufhidden=
setlocal buflisted
legacy setlocal buftype=
setlocal cindent
legacy setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
legacy setlocal cinoptions=
legacy setlocal cinscopedecls=public,protected,private
legacy setlocal cinwords=if,else,while,do,for,switch
legacy setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
legacy setlocal complete=.,w,b,u,t,i
legacy setlocal completefunc=
legacy setlocal completeopt=
legacy setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
legacy setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
legacy setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
legacy setlocal dictionary=
setlocal nodiff
legacy setlocal diffanchors=
legacy setlocal equalprg=
legacy setlocal errorformat=
legacy setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
legacy setlocal fillchars=
legacy setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
legacy setlocal foldexpr=0
legacy setlocal foldignore=#
setlocal foldlevel=0
legacy setlocal foldmarker={{{,}}}
legacy setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
legacy setlocal foldtext=foldtext()
legacy setlocal formatexpr=
legacy setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
legacy setlocal formatprg=
legacy setlocal grepformat=
legacy setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
legacy setlocal includeexpr=
legacy setlocal indentexpr=
legacy setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
legacy setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
legacy setlocal lispoptions=
legacy setlocal lispwords=
setlocal nolist
legacy setlocal listchars=
legacy setlocal makeencoding=
legacy setlocal makeprg=
legacy setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
legacy setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
legacy setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
legacy setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
legacy setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
legacy setlocal showbreak=
setlocal sidescrolloff=-1
legacy setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
legacy setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
legacy setlocal spellfile=
legacy setlocal spelllang=en
legacy setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(1)
legacy setlocal statuslineopt=
legacy setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
legacy setlocal tagcase=
legacy setlocal tagfunc=
legacy setlocal tags=
legacy setlocal termwinkey=
setlocal termwinscroll=10000
legacy setlocal termwinsize=
setlocal textwidth=0
legacy setlocal thesaurus=
legacy setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
legacy setlocal varsofttabstop=
legacy setlocal vartabstop=
legacy setlocal virtualedit=
legacy setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
legacy setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 16 - ((15 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :16
  normal! 0
}
tabnext
edit textbar.h
save_splitbelow = &splitbelow
save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
:1wincmd h
wincmd w
&splitbelow = save_splitbelow
&splitright = save_splitright
wincmd t
save_winminheight = &winminheight
save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert :1resize ' .. ((&columns * 158 + 159) / 319)
exe 'vert :2resize ' .. ((&columns * 160 + 159) / 319)
argglobal
balt textbar.c
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
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
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal completeopt=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
setlocal dictionary=
setlocal nodiff
setlocal diffanchors=
setlocal equalprg=
setlocal errorformat=
setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal fillchars=
setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
setlocal formatprg=
setlocal grepformat=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(1)
setlocal statuslineopt=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 1 - ((0 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :1
  normal! 0
}
wincmd w
argglobal
if bufexists(fnamemodify("textbar.c", ":p")) | buffer textbar.c | else | edit textbar.c | endif
balt textbar.h
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
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
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal completeopt=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
setlocal dictionary=
setlocal nodiff
setlocal diffanchors=
setlocal equalprg=
setlocal errorformat=
setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal fillchars=
setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
setlocal formatprg=
setlocal grepformat=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(2)
setlocal statuslineopt=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 82 - ((6 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :82
  normal! 0
}
wincmd w
exe 'vert :1resize ' .. ((&columns * 158 + 159) / 319)
exe 'vert :2resize ' .. ((&columns * 160 + 159) / 319)
tabnext
edit widgets.h
argglobal
balt textbar.c
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
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
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal completeopt=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
setlocal dictionary=
setlocal nodiff
setlocal diffanchors=
setlocal equalprg=
setlocal errorformat=
setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal fillchars=
setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
setlocal formatprg=
setlocal grepformat=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(1)
setlocal statuslineopt=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 1 - ((0 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :1
  normal! 0
}
tabnext
edit gui.h
save_splitbelow = &splitbelow
save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
:1wincmd h
wincmd w
&splitbelow = save_splitbelow
&splitright = save_splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert :1resize ' .. ((&columns * 130 + 159) / 319)
exe 'vert :2resize ' .. ((&columns * 188 + 159) / 319)
argglobal
balt gui.c
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
legacy setlocal keymap=
setlocal noarabic
setlocal noautoindent
legacy setlocal backupcopy=
legacy setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
legacy setlocal breakindentopt=
legacy setlocal bufhidden=
setlocal buflisted
legacy setlocal buftype=
setlocal cindent
legacy setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
legacy setlocal cinoptions=
legacy setlocal cinscopedecls=public,protected,private
legacy setlocal cinwords=if,else,while,do,for,switch
legacy setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
legacy setlocal complete=.,w,b,u,t,i
legacy setlocal completefunc=
legacy setlocal completeopt=
legacy setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
legacy setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
legacy setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
legacy setlocal dictionary=
setlocal nodiff
legacy setlocal diffanchors=
legacy setlocal equalprg=
legacy setlocal errorformat=
legacy setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
legacy setlocal fillchars=
legacy setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
legacy setlocal foldexpr=0
legacy setlocal foldignore=#
setlocal foldlevel=0
legacy setlocal foldmarker={{{,}}}
legacy setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
legacy setlocal foldtext=foldtext()
legacy setlocal formatexpr=
legacy setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
legacy setlocal formatprg=
legacy setlocal grepformat=
legacy setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
legacy setlocal includeexpr=
legacy setlocal indentexpr=
legacy setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
legacy setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
legacy setlocal lispoptions=
legacy setlocal lispwords=
setlocal nolist
legacy setlocal listchars=
legacy setlocal makeencoding=
legacy setlocal makeprg=
legacy setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
legacy setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
legacy setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
legacy setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
legacy setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
legacy setlocal showbreak=
setlocal sidescrolloff=-1
legacy setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
legacy setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
legacy setlocal spellfile=
legacy setlocal spelllang=en
legacy setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(1)
legacy setlocal statuslineopt=
legacy setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
legacy setlocal tagcase=
legacy setlocal tagfunc=
legacy setlocal tags=
legacy setlocal termwinkey=
setlocal termwinscroll=10000
legacy setlocal termwinsize=
setlocal textwidth=0
legacy setlocal thesaurus=
legacy setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
legacy setlocal varsofttabstop=
legacy setlocal vartabstop=
legacy setlocal virtualedit=
legacy setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
legacy setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 19 - ((18 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :19
  normal! 06|
}
wincmd w
argglobal
if bufexists(fnamemodify("gui.c", ":p")) | buffer gui.c | else | edit gui.c | endif
balt main.c
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
legacy setlocal keymap=
setlocal noarabic
setlocal noautoindent
legacy setlocal backupcopy=
legacy setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
legacy setlocal breakindentopt=
legacy setlocal bufhidden=
setlocal buflisted
legacy setlocal buftype=
setlocal cindent
legacy setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
legacy setlocal cinoptions=
legacy setlocal cinscopedecls=public,protected,private
legacy setlocal cinwords=if,else,while,do,for,switch
legacy setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
legacy setlocal complete=.,w,b,u,t,i
legacy setlocal completefunc=
legacy setlocal completeopt=
legacy setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
legacy setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
legacy setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
legacy setlocal dictionary=
setlocal nodiff
legacy setlocal diffanchors=
legacy setlocal equalprg=
legacy setlocal errorformat=
legacy setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
legacy setlocal fillchars=
legacy setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
legacy setlocal foldexpr=0
legacy setlocal foldignore=#
setlocal foldlevel=0
legacy setlocal foldmarker={{{,}}}
legacy setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
legacy setlocal foldtext=foldtext()
legacy setlocal formatexpr=
legacy setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
legacy setlocal formatprg=
legacy setlocal grepformat=
legacy setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
legacy setlocal includeexpr=
legacy setlocal indentexpr=
legacy setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
legacy setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
legacy setlocal lispoptions=
legacy setlocal lispwords=
setlocal nolist
legacy setlocal listchars=
legacy setlocal makeencoding=
legacy setlocal makeprg=
legacy setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
legacy setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
legacy setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
legacy setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
legacy setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
legacy setlocal showbreak=
setlocal sidescrolloff=-1
legacy setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
legacy setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
legacy setlocal spellfile=
legacy setlocal spelllang=en
legacy setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(2)
legacy setlocal statuslineopt=
legacy setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
legacy setlocal tagcase=
legacy setlocal tagfunc=
legacy setlocal tags=
legacy setlocal termwinkey=
setlocal termwinscroll=10000
legacy setlocal termwinsize=
setlocal textwidth=0
legacy setlocal thesaurus=
legacy setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
legacy setlocal varsofttabstop=
legacy setlocal vartabstop=
legacy setlocal virtualedit=
legacy setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
legacy setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 124 - ((18 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :124
  normal! 0
}
wincmd w
exe 'vert :1resize ' .. ((&columns * 130 + 159) / 319)
exe 'vert :2resize ' .. ((&columns * 188 + 159) / 319)
tabnext
edit buck.h
save_splitbelow = &splitbelow
save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
:1wincmd h
wincmd w
&splitbelow = save_splitbelow
&splitright = save_splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert :1resize ' .. ((&columns * 130 + 159) / 319)
exe 'vert :2resize ' .. ((&columns * 188 + 159) / 319)
argglobal
balt buck.c
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
legacy setlocal keymap=
setlocal noarabic
setlocal noautoindent
legacy setlocal backupcopy=
legacy setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
legacy setlocal breakindentopt=
legacy setlocal bufhidden=
setlocal buflisted
legacy setlocal buftype=
setlocal cindent
legacy setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
legacy setlocal cinoptions=
legacy setlocal cinscopedecls=public,protected,private
legacy setlocal cinwords=if,else,while,do,for,switch
legacy setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
legacy setlocal complete=.,w,b,u,t,i
legacy setlocal completefunc=
legacy setlocal completeopt=
legacy setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
legacy setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
legacy setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
legacy setlocal dictionary=
setlocal nodiff
legacy setlocal diffanchors=
legacy setlocal equalprg=
legacy setlocal errorformat=
legacy setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
legacy setlocal fillchars=
legacy setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
legacy setlocal foldexpr=0
legacy setlocal foldignore=#
setlocal foldlevel=0
legacy setlocal foldmarker={{{,}}}
legacy setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
legacy setlocal foldtext=foldtext()
legacy setlocal formatexpr=
legacy setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
legacy setlocal formatprg=
legacy setlocal grepformat=
legacy setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
legacy setlocal includeexpr=
legacy setlocal indentexpr=
legacy setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
legacy setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
legacy setlocal lispoptions=
legacy setlocal lispwords=
setlocal nolist
legacy setlocal listchars=
legacy setlocal makeencoding=
legacy setlocal makeprg=
legacy setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
legacy setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
legacy setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
legacy setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
legacy setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
legacy setlocal showbreak=
setlocal sidescrolloff=-1
legacy setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
legacy setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
legacy setlocal spellfile=
legacy setlocal spelllang=en
legacy setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(1)
legacy setlocal statuslineopt=
legacy setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
legacy setlocal tagcase=
legacy setlocal tagfunc=
legacy setlocal tags=
legacy setlocal termwinkey=
setlocal termwinscroll=10000
legacy setlocal termwinsize=
setlocal textwidth=0
legacy setlocal thesaurus=
legacy setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
legacy setlocal varsofttabstop=
legacy setlocal vartabstop=
legacy setlocal virtualedit=
legacy setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
legacy setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 37 - ((36 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :37
  normal! 0
}
wincmd w
argglobal
if bufexists(fnamemodify("buck.c", ":p")) | buffer buck.c | else | edit buck.c | endif
balt gui.c
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
legacy setlocal keymap=
setlocal noarabic
setlocal noautoindent
legacy setlocal backupcopy=
legacy setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
legacy setlocal breakindentopt=
legacy setlocal bufhidden=
setlocal buflisted
legacy setlocal buftype=
setlocal cindent
legacy setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
legacy setlocal cinoptions=
legacy setlocal cinscopedecls=public,protected,private
legacy setlocal cinwords=if,else,while,do,for,switch
legacy setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
legacy setlocal complete=.,w,b,u,t,i
legacy setlocal completefunc=
legacy setlocal completeopt=
legacy setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
legacy setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
legacy setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
legacy setlocal dictionary=
setlocal nodiff
legacy setlocal diffanchors=
legacy setlocal equalprg=
legacy setlocal errorformat=
legacy setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
legacy setlocal fillchars=
legacy setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
legacy setlocal foldexpr=0
legacy setlocal foldignore=#
setlocal foldlevel=0
legacy setlocal foldmarker={{{,}}}
legacy setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
legacy setlocal foldtext=foldtext()
legacy setlocal formatexpr=
legacy setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
legacy setlocal formatprg=
legacy setlocal grepformat=
legacy setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
legacy setlocal includeexpr=
legacy setlocal indentexpr=
legacy setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
legacy setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
legacy setlocal lispoptions=
legacy setlocal lispwords=
setlocal nolist
legacy setlocal listchars=
legacy setlocal makeencoding=
legacy setlocal makeprg=
legacy setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
legacy setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
legacy setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
legacy setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
legacy setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
legacy setlocal showbreak=
setlocal sidescrolloff=-1
legacy setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
legacy setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
legacy setlocal spellfile=
legacy setlocal spelllang=en
legacy setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(2)
legacy setlocal statuslineopt=
legacy setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
legacy setlocal tagcase=
legacy setlocal tagfunc=
legacy setlocal tags=
legacy setlocal termwinkey=
setlocal termwinscroll=10000
legacy setlocal termwinsize=
setlocal textwidth=0
legacy setlocal thesaurus=
legacy setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
legacy setlocal varsofttabstop=
legacy setlocal vartabstop=
legacy setlocal virtualedit=
legacy setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
legacy setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 166 - ((0 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :166
  normal! 09|
}
wincmd w
exe 'vert :1resize ' .. ((&columns * 130 + 159) / 319)
exe 'vert :2resize ' .. ((&columns * 188 + 159) / 319)
tabnext
edit buffer.h
save_splitbelow = &splitbelow
save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
:1wincmd h
wincmd w
&splitbelow = save_splitbelow
&splitright = save_splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert :1resize ' .. ((&columns * 130 + 159) / 319)
exe 'vert :2resize ' .. ((&columns * 188 + 159) / 319)
argglobal
balt buck.h
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
legacy setlocal keymap=
setlocal noarabic
setlocal noautoindent
legacy setlocal backupcopy=
legacy setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
legacy setlocal breakindentopt=
legacy setlocal bufhidden=
setlocal buflisted
legacy setlocal buftype=
setlocal cindent
legacy setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
legacy setlocal cinoptions=
legacy setlocal cinscopedecls=public,protected,private
legacy setlocal cinwords=if,else,while,do,for,switch
legacy setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
legacy setlocal complete=.,w,b,u,t,i
legacy setlocal completefunc=
legacy setlocal completeopt=
legacy setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
legacy setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
legacy setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
legacy setlocal dictionary=
setlocal nodiff
legacy setlocal diffanchors=
legacy setlocal equalprg=
legacy setlocal errorformat=
legacy setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
legacy setlocal fillchars=
legacy setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
legacy setlocal foldexpr=0
legacy setlocal foldignore=#
setlocal foldlevel=0
legacy setlocal foldmarker={{{,}}}
legacy setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
legacy setlocal foldtext=foldtext()
legacy setlocal formatexpr=
legacy setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
legacy setlocal formatprg=
legacy setlocal grepformat=
legacy setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
legacy setlocal includeexpr=
legacy setlocal indentexpr=
legacy setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
legacy setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
legacy setlocal lispoptions=
legacy setlocal lispwords=
setlocal nolist
legacy setlocal listchars=
legacy setlocal makeencoding=
legacy setlocal makeprg=
legacy setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
legacy setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
legacy setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
legacy setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
legacy setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
legacy setlocal showbreak=
setlocal sidescrolloff=-1
legacy setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
legacy setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
legacy setlocal spellfile=
legacy setlocal spelllang=en
legacy setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(1)
legacy setlocal statuslineopt=
legacy setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
legacy setlocal tagcase=
legacy setlocal tagfunc=
legacy setlocal tags=
legacy setlocal termwinkey=
setlocal termwinscroll=10000
legacy setlocal termwinsize=
setlocal textwidth=0
legacy setlocal thesaurus=
legacy setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
legacy setlocal varsofttabstop=
legacy setlocal vartabstop=
legacy setlocal virtualedit=
legacy setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
legacy setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 1 - ((0 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :1
  normal! 0
}
wincmd w
argglobal
if bufexists(fnamemodify("buffer.c", ":p")) | buffer buffer.c | else | edit buffer.c | endif
balt buffer.h
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
legacy setlocal keymap=
setlocal noarabic
setlocal noautoindent
legacy setlocal backupcopy=
legacy setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
legacy setlocal breakindentopt=
legacy setlocal bufhidden=
setlocal buflisted
legacy setlocal buftype=
setlocal cindent
legacy setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
legacy setlocal cinoptions=
legacy setlocal cinscopedecls=public,protected,private
legacy setlocal cinwords=if,else,while,do,for,switch
legacy setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
legacy setlocal complete=.,w,b,u,t,i
legacy setlocal completefunc=
legacy setlocal completeopt=
legacy setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
legacy setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
legacy setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
legacy setlocal dictionary=
setlocal nodiff
legacy setlocal diffanchors=
legacy setlocal equalprg=
legacy setlocal errorformat=
legacy setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
legacy setlocal fillchars=
legacy setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
legacy setlocal foldexpr=0
legacy setlocal foldignore=#
setlocal foldlevel=0
legacy setlocal foldmarker={{{,}}}
legacy setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
legacy setlocal foldtext=foldtext()
legacy setlocal formatexpr=
legacy setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
legacy setlocal formatprg=
legacy setlocal grepformat=
legacy setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
legacy setlocal includeexpr=
legacy setlocal indentexpr=
legacy setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
legacy setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
legacy setlocal lispoptions=
legacy setlocal lispwords=
setlocal nolist
legacy setlocal listchars=
legacy setlocal makeencoding=
legacy setlocal makeprg=
legacy setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
legacy setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
legacy setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
legacy setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
legacy setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
legacy setlocal showbreak=
setlocal sidescrolloff=-1
legacy setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
legacy setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
legacy setlocal spellfile=
legacy setlocal spelllang=en
legacy setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(2)
legacy setlocal statuslineopt=
legacy setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
legacy setlocal tagcase=
legacy setlocal tagfunc=
legacy setlocal tags=
legacy setlocal termwinkey=
setlocal termwinscroll=10000
legacy setlocal termwinsize=
setlocal textwidth=0
legacy setlocal thesaurus=
legacy setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
legacy setlocal varsofttabstop=
legacy setlocal vartabstop=
legacy setlocal virtualedit=
legacy setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
legacy setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 1 - ((0 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :1
  normal! 0
}
wincmd w
exe 'vert :1resize ' .. ((&columns * 130 + 159) / 319)
exe 'vert :2resize ' .. ((&columns * 188 + 159) / 319)
tabnext
edit color.h
argglobal
balt buffer.c
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
legacy setlocal keymap=
setlocal noarabic
setlocal noautoindent
legacy setlocal backupcopy=
legacy setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
legacy setlocal breakindentopt=
legacy setlocal bufhidden=
setlocal buflisted
legacy setlocal buftype=
setlocal cindent
legacy setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
legacy setlocal cinoptions=
legacy setlocal cinscopedecls=public,protected,private
legacy setlocal cinwords=if,else,while,do,for,switch
legacy setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
legacy setlocal complete=.,w,b,u,t,i
legacy setlocal completefunc=
legacy setlocal completeopt=
legacy setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
legacy setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
legacy setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
legacy setlocal dictionary=
setlocal nodiff
legacy setlocal diffanchors=
legacy setlocal equalprg=
legacy setlocal errorformat=
legacy setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
legacy setlocal fillchars=
legacy setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
legacy setlocal foldexpr=0
legacy setlocal foldignore=#
setlocal foldlevel=0
legacy setlocal foldmarker={{{,}}}
legacy setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
legacy setlocal foldtext=foldtext()
legacy setlocal formatexpr=
legacy setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
legacy setlocal formatprg=
legacy setlocal grepformat=
legacy setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
legacy setlocal includeexpr=
legacy setlocal indentexpr=
legacy setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
legacy setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
legacy setlocal lispoptions=
legacy setlocal lispwords=
setlocal nolist
legacy setlocal listchars=
legacy setlocal makeencoding=
legacy setlocal makeprg=
legacy setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
legacy setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
legacy setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
legacy setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
legacy setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
legacy setlocal showbreak=
setlocal sidescrolloff=-1
legacy setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
legacy setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
legacy setlocal spellfile=
legacy setlocal spelllang=en
legacy setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(1)
legacy setlocal statuslineopt=
legacy setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
legacy setlocal tagcase=
legacy setlocal tagfunc=
legacy setlocal tags=
legacy setlocal termwinkey=
setlocal termwinscroll=10000
legacy setlocal termwinsize=
setlocal textwidth=0
legacy setlocal thesaurus=
legacy setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
legacy setlocal varsofttabstop=
legacy setlocal vartabstop=
legacy setlocal virtualedit=
legacy setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
legacy setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 1 - ((0 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :1
  normal! 0
}
tabnext
edit makefile
argglobal
balt color.h
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
legacy setlocal keymap=
setlocal noarabic
setlocal noautoindent
legacy setlocal backupcopy=
legacy setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
legacy setlocal breakindentopt=
legacy setlocal bufhidden=
setlocal buflisted
legacy setlocal buftype=
setlocal nocindent
legacy setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
legacy setlocal cinoptions=
legacy setlocal cinscopedecls=public,protected,private
legacy setlocal cinwords=if,else,while,do,for,switch
legacy setlocal colorcolumn=
legacy setlocal comments=sO:#\ -,mO:#\ \ ,b:#
legacy setlocal commentstring=#\ %s
legacy setlocal complete=.,w,b,u,t,i
legacy setlocal completefunc=
legacy setlocal completeopt=
legacy setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
legacy setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
legacy setlocal cursorlineopt=both
legacy setlocal define=
legacy setlocal dictionary=
setlocal nodiff
legacy setlocal diffanchors=
legacy setlocal equalprg=
legacy setlocal errorformat=
legacy setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'make'
setlocal filetype=make
endif
legacy setlocal fillchars=
legacy setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
legacy setlocal foldexpr=0
legacy setlocal foldignore=#
setlocal foldlevel=0
legacy setlocal foldmarker={{{,}}}
legacy setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
legacy setlocal foldtext=foldtext()
legacy setlocal formatexpr=
legacy setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
legacy setlocal formatprg=
legacy setlocal grepformat=
legacy setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*include
legacy setlocal includeexpr=
legacy setlocal indentexpr=GetMakeIndent()
legacy setlocal indentkeys=!^F,o,O,<:>,=else,=endif
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
legacy setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
legacy setlocal lispoptions=
legacy setlocal lispwords=
setlocal nolist
legacy setlocal listchars=
legacy setlocal makeencoding=
legacy setlocal makeprg=
legacy setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
legacy setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=
legacy setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
legacy setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
legacy setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=0
setlocal noshortname
legacy setlocal showbreak=
setlocal sidescrolloff=-1
legacy setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
legacy setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
legacy setlocal spellfile=
legacy setlocal spelllang=en
legacy setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(1)
legacy setlocal statuslineopt=
legacy setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'make'
legacy setlocal syntax=make
endif
setlocal tabstop=4
legacy setlocal tagcase=
legacy setlocal tagfunc=
legacy setlocal tags=
legacy setlocal termwinkey=
setlocal termwinscroll=10000
legacy setlocal termwinsize=
setlocal textwidth=0
legacy setlocal thesaurus=
legacy setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
legacy setlocal varsofttabstop=
legacy setlocal vartabstop=
legacy setlocal virtualedit=
legacy setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
legacy setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 21 - ((20 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :21
  normal! 032|
}
tabnext
edit controls.h
argglobal
balt gui.h
cpo_save = &cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> î :call AutoPairsJump()a
legacy inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
&cpo = cpo_save
legacy setlocal keymap=
setlocal noarabic
setlocal noautoindent
legacy setlocal backupcopy=
legacy setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
legacy setlocal breakindentopt=
legacy setlocal bufhidden=
setlocal buflisted
legacy setlocal buftype=
setlocal cindent
legacy setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
legacy setlocal cinoptions=
legacy setlocal cinscopedecls=public,protected,private
legacy setlocal cinwords=if,else,while,do,for,switch
legacy setlocal colorcolumn=
legacy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://
legacy setlocal commentstring=/*\ %s\ */
legacy setlocal complete=.,w,b,u,t,i
legacy setlocal completefunc=
legacy setlocal completeopt=
legacy setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
legacy setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
legacy setlocal cursorlineopt=both
legacy setlocal define=^\\s*#\\s*define
legacy setlocal dictionary=
setlocal nodiff
legacy setlocal diffanchors=
legacy setlocal equalprg=
legacy setlocal errorformat=
legacy setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
legacy setlocal fillchars=
legacy setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
legacy setlocal foldexpr=0
legacy setlocal foldignore=#
setlocal foldlevel=0
legacy setlocal foldmarker={{{,}}}
legacy setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
legacy setlocal foldtext=foldtext()
legacy setlocal formatexpr=
legacy setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
legacy setlocal formatoptions=croql
legacy setlocal formatprg=
legacy setlocal grepformat=
legacy setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
legacy setlocal include=^\\s*#\\s*include
legacy setlocal includeexpr=
legacy setlocal indentexpr=
legacy setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
legacy setlocal iskeyword=@,48-57,_,192-255
legacy setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
legacy setlocal lispoptions=
legacy setlocal lispwords=
setlocal nolist
legacy setlocal listchars=
legacy setlocal makeencoding=
legacy setlocal makeprg=
legacy setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
legacy setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
legacy setlocal omnifunc=ccomplete#Complete
legacy setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
legacy setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
legacy setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal scrolloffpad=-1
setlocal shiftwidth=4
setlocal noshortname
legacy setlocal showbreak=
setlocal sidescrolloff=-1
legacy setlocal signcolumn=auto
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
legacy setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
legacy setlocal spellfile=
legacy setlocal spelllang=en
legacy setlocal spelloptions=
legacy setlocal statusline=%!airline#statusline(1)
legacy setlocal statuslineopt=
legacy setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
legacy setlocal syntax=c
endif
setlocal tabstop=4
legacy setlocal tagcase=
legacy setlocal tagfunc=
legacy setlocal tags=
legacy setlocal termwinkey=
setlocal termwinscroll=10000
legacy setlocal termwinsize=
setlocal textwidth=0
legacy setlocal thesaurus=
legacy setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
legacy setlocal varsofttabstop=
legacy setlocal vartabstop=
legacy setlocal virtualedit=
legacy setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
legacy setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
&fdl = &fdl
{
  var l: number = 11 - ((10 * winheight(0) + 41) / 82)
  if l < 1 | l = 1 | endif
  keepjumps exe ":" .. l
  normal! zt
  keepjumps :11
  normal! 0
}
tabnext 3
set stal=1
if wipebuf != -1 && len(win_findbuf(wipebuf)) == 0
  silent exe 'bwipe ' .. wipebuf
endif
&winheight = max([1, save_winminheight])
&winwidth = max([20, save_winminwidth])
set shortmess=filnxtToOS
&winminheight = save_winminheight
&winminwidth = save_winminwidth
var sx: string = expand("<sfile>:p:r") .. "x.vim"
if filereadable(sx)
  exe "source " .. fnameescape(sx)
endif
&g:so = so_save | &g:siso = siso_save
nohlsearch
doautoall SessionLoadPost
unlet g:SessionLoad
# vim: set ft=vim :

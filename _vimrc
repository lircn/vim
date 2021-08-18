" LiR <6007381@qq.com>

""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

let mapleader = "\<SPACE>"             " must on the top
let g:mapleader = "\<SPACE>"

" Fast saving
nmap <leader>w :w!<cr>

" 折叠
set foldmethod=syntax
"zi 打开关闭折叠
"zv 查看此行
"zm 关闭折叠
"zM 关闭所有
"zr 打开
"zR 打开所有
"zc 折叠当前行
"zo 打开当前折叠
"zd 删除折叠
"zD 删除所有折叠

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

set title
set textwidth=0
set nu
set showcmd
set foldlevel=50
if has('mouse')
    set mouse=a
endif

" persistent undo
set undofile
set undodir=~/.vim/undodir


""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif




""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

colorscheme darkburn_lir

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac




""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile




""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
"set noexpandtab   " replace tab to space. use <C-V><Tab> to insert a real tab.

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" 将tab显示为>-,尾行空格显示为-
set listchars=tab:>-,trail:-
set list





""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> <F6> :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" When you press <leader>r you can search and replace the selected text
" append /g to the end to replace all
vmap <leader>r :call VisualSelection('replace', '')<CR>

" When you press gv you vimgrep after the selected text
vmap <leader>gv :call VisualSelection('gv', '')<CR>

" Look up dictionary, cover IndexedSearch's map
nmap ? :call Dict(expand("<cword>"))<CR>
vnoremap ? :call VisualSelection('?', '')<CR>

" output to json format
vmap <leader>jp :!jp<CR>









""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting all the same word under the cursor, like use SI.
nmap <F6> /\C\<<C-R>=expand("<cword>")<CR>\><CR>N

" Disable highlight
map <leader><CR> :noh<CR>

" Move between windows
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif





""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c






""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
" replaced by <C-c>
nmap - ^
nmap = $

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")

nmap <F9> :call Clean()<CR>

" Map leader
map <leader>ss :source ~/.vimrc<CR>:noh<CR>
map <leader>ee :e ~/.vimrc<CR>
map <leader>a A
map <leader>q :q!<CR>

" Copy to CLIPBOARD, and use 'y' to copy to the PRIMARY
" vim-gnome
map <leader>y "+y
map <leader>p "+p

" Switch CWD
map <leader>cd :cd %:p:h<CR>:call GetCwd()<CR>

" Reload cscope and lookup database
map <leader>rl :cs add cscope.out<CR>:let g:LookupFile_TagExpr = '"./filenametags"'<CR>




""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Fix ml_get error
let g:netrw_use_noswf= 0




""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL-P
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map= '<C-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_lazy_update = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_regexp = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:40'
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll)$',
\ }


" ZenCoding
" Enable all functions in all modes
"mattn/emmet-vim
"let g:user_zen_mode='a'


" Snippet
Plugin 'SirVer/ultisnips'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
"inoremap <tab> <c-r>=UltiSnips#ExpandSnippet()<cr>
let g:snips_author = 'LiR <6007381@qq.com>'
let g:UltiSnipsSnippetDirectories=["~/.vim/bundle/vim-snippets/UltiSnips", "lirsnippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger = "<C-p>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Grep
Plugin 'mileszs/ack.vim'
map <leader><F6> :Ack <C-R>=expand("<cword>")<CR><CR>


" NERDTree
Plugin 'scrooloose/nerdtree.git'
map <silent> <F3> :NERDTreeToggle<CR>
map <silent> <Leader><F3> :NERDTreeFind<CR>
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeWinPos='right'
let NERDTreeWinSize=45
let NERDTreeShowLineNumbers=0
let NERDTreeIgnore=['\.pyc$', '__pycache__', 'cscope.in.out', 'cscope.out', 'cscope.files', 'cscope.po.out', 'tags', '\.swp$', '\.git$', '\.svn$']
let NERDTreeMapToggleZoom='z'
let NERDTreeMinimalUI=1


" vim-multiple-cursors
Plugin 'terryma/vim-multiple-cursors'
"start: <C-n> start multicursor and add a virtual cursor + selection on the match
"   next: <C-n> add a new virtual cursor + selection on the next match
"   skip: <C-x> skip the next match
"   prev: <C-p> remove current virtual cursor + selection and go back on previous match
"select all: <A-n> start muticursor and directly select all matches


" surround.vim
" Annotate strings with gettext 
Plugin 'tpope/vim-surround'
" in v mode, press S + <any brackets>


" lightline
""Plugin 'itchyny/lightline.vim'
""let g:lightline = {
""      \ 'colorscheme': 'wombat',
""      \ }
""
""let g:lightline = {
""      \ 'colorscheme': 'wombat',
""      \ 'active': {
""      \   'left': [ ['mode', 'paste'],
""      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
""      \   'right': [ [ 'lineinfo' ], ['percent'] ]
""      \ },
""      \ 'component': {
""      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
""      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
""      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
""      \ },
""      \ 'component_visible_condition': {
""      \   'readonly': '(&filetype!="help"&& &readonly)',
""      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
""      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
""      \ },
""      \ 'separator': { 'left': ' ', 'right': ' ' },
""      \ 'subseparator': { 'left': ' ', 'right': ' ' }
""      \ }


" support golang
Plugin 'fatih/vim-go'

let g:go_def_mode = 'gopls'
autocmd FileType go nnoremap <buffer> <C-]>: call GodefUnderCursor()<cr>

" Syntastic (syntax checker)
Plugin 'vim-syntastic/syntastic'
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_cpp_include_dirs = ['/usr/include/']
" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0


" support vue
Plugin 'posva/vim-vue'
au BufRead,BufNewFile *.wpy setlocal filetype=vue.html.javascript.css


" Tags
Plugin 'majutsushi/tagbar'
map <silent> <F2> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_map_zoomwin = "z"
let g:tagbar_map_togglefold = "x"
let g:tagbar_map_jump = "o""
let g:tagbar_autofocus = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" L9
Plugin 'vim-scripts/L9'


" YouCompleteMe YCM
Plugin 'Valloric/YouCompleteMe'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
"let g:ycm_show_diagnostics_ui = 0
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Git
Plugin 'tpope/vim-fugitive'

" Misc
Plugin 'vim-scripts/DrawIt'
Plugin 'uguu-org/vim-matrix-screensaver'

" Markdown
Plugin 'plasticboy/vim-markdown'


" Cscope
if has("cscope")
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
    "set cscopequickfix=s-,g-,c-,t-,e-,f-,i-,d-
endif
"s: Find this C symbol
"g: Find this definition
"c: Find functions calling this function
"t: Find this text string
"d: Find functions called by this function
"   *gd* will be more helpful without cscope database
"e: Find this egrep pattern
"f: Find this file
"   *gf* will be more helpful without cscope database
"i: Find files #including this file
nmap <F5>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F5>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <F5>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <F5>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <F5>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <F5>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <F5>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <F5>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>


" Powerline, airline
set rtp+=~/git/powerline/powerline/bindings/vim
set showtabline=2
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
""" Top 2:
""" badwolf
""" dark
""let g:airline_theme = "badwolf"


" vim-expand-region
Plugin 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


" Normal map
nmap ` .


" use Q for recording
noremap q <Nop>
noremap Q q


" Auto convert a word to a $(shell variable
imap <C-h> <ESC>bi${<ESC>exea}
imap <C-g> <ESC>bi$(<ESC>exea)

" jump to the match brace
map ]] ]}
map [[ [{

" Open a fully width quickfix window at the bottom of vim
map <F8> :botright cwindow<CR>


nmap <F12> :call Do_CsTag()<CR>


" 行选择,然后:Tabularize/=则把所选行的=全部对齐
Plugin 'godlygeek/tabular'
vmap <leader>= :Tabularize/

" format for js
Plugin 'maksimr/vim-jsbeautify'
map <leader>jsb :'<,'>!js-beautify -i<CR>
autocmd FileType javascript noremap <buffer>  <leader>jsb :call JsBeautify()<CR>
autocmd FileType html noremap <buffer> <leader>htmlb :call HtmlBeautify()<CR>
autocmd FileType css noremap <buffer> <leader>cssb :call CSSBeautify()<CR>

" Color
set t_Co=256


" 括号和引号补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i

" inoremap ) <c-r>=ClosePair(')')<CR>
" inoremap ] <C-r>=ClosePair(']')<CR>
" inoremap } <C-r>=CloseBracket()<CR>
inoremap " <C-r>=QuoteDelim('"')<CR>
inoremap ' <C-r>=QuoteDelim("'")<CR>

" highlight
set mps+=<:>

" 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
Plugin 't9md/vim-choosewin'
" 使用 ALT+E 来选择窗口
nmap - <Plug>(choosewin)


" required"
call vundle#end()


" nodejs
Plugin 'moll/vim-node'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == '?'
        call Dict(l:pattern)
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! Clean()
    exec 'retab'
    exec '%s/\s\+$//e'
    exec 'silent! %s/$//g'
endfunction

function! Dict(word)
  let expl=system('sdcv -n ' .
        \  expand(a:word))
  windo if
        \ expand("%")=="diCt-tmp" |
        \ q!|endif
  rightbelow 30vsp diCt-tmp
  setlocal buftype=nofile bufhidden=hide noswapfile
  1s/^/\=expl/
  1
endfunction

function! GetCwd()
    let l:cwd = getcwd()
    call CmdLine("cd " . l:cwd)
endfunction

function! Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        let tagsdeleted = delete("./"."tags")
        if(tagsdeleted != 0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        let csfilesdeleted=delete("./"."cscope.files")
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        let csoutdeleted=delete("./"."cscope.out")
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        silent! execute "!ctags -R --c++-kinds=+pf --fields=+imaSft --extra=+q"
        " execute "!ctags -R --c++-kinds=-p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope')&&has("cscope"))
        silent! execute "!find . -name '.svn' -prune -o -name '.git' -prune -o -name '*.h' -o -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
    endif
    execute "!cscope -Rbq"
    execute "normal :"
    if filereadable("cscope.out")
        execute "cs add cscope.out"
    endif
    let g:LookupFile_TagExpr = '"./filenametags"'
endfunction

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function! CloseBracket()
    if match(getline(line('.') + 1), '\s*}') < 0
        return "}"
    else
        return "\<Esc>j0f}a"
    endif
endf

function! QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        " Inserting a quoted quotation mark into the string
        return a:char
    elseif line[col - 1] == a:char
        " Escaping out of the string
        return "\<Right>"
    else
        " Starting a string
        return a:char.a:char."\<Esc>i"
    endif
endf

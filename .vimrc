" Bundles
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/SQLUtilities', { 'for': 'sql' }
Plug 'vim-scripts/Align'
Plug 'Shougo/neocomplcache'
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass', 'css'] }
Plug 'edsono/vim-matchit'
Plug 'godlygeek/tabular'
Plug 'groenewege/vim-less', { 'for': ['less', 'css'] }
Plug 'juvenn/mustache.vim'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'msanders/cocoa.vim'
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'jakar/vim-json'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/sudo.vim'
"Plug 'sukima/xmledit'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'terryma/vim-multiple-cursors'
Plug 'gregsexton/gitv'
Plug 'rking/ag.vim'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'rizzatti/dash.vim'
Plug 'Yggdroot/indentLine'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
"Plug 'Townk/vim-autoclose'
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'w0ng/vim-hybrid'
Plug 'elixir-lang/vim-elixir'
Plug 'lambdalisue/vim-unified-diff'
Plug 'ekalinin/Dockerfile.vim'
Plug 'bling/vim-airline'
call plug#end()

" key map
imap <C-j> <esc>
let mapleader=" "
nnoremap <C-j><C-j> :nohlsearch<CR>
nnoremap * *N
nnoremap # #N
set pastetoggle=<C-E>
nnoremap <C-g>p `.zz
nnoremap <C-g><C-o> g;
nnoremap <C-g><C-i> g,
nmap r <Plug>(operator-replace)

" General
filetype on               " detect the type of file
syntax on
set history=10000         " How many lines of history to remember
set cf                    " enable error files and error jumping
filetype plugin indent on " Enable filetype-specific indenting and plugins
set viminfo+=!            " make sure it can save viminfo
set isk+=_,$,@,%,#,-      " none of these should be word dividers, so make them not be
set nobackup
set noswapfile
set iminsert=0
set imsearch=0
set ffs=unix,dos,mac
let g:context_filetype#search_offset = 300

" Theme/Colors
set t_Co=256
set background=dark
colorscheme hybrid

" OS dependent
if has("win32")
  set guifont=MS_Gothic:h11:cSHIFTJIS
  set printfont=MS_Gothic:h9:cSHIFTJIS
  set printoptions=number:y
elseif has('mac')
  set guifont=Monaco:h12
else
  set guifontset=a14,r14,k14
endif

" Vim UI
set wildmenu     " turn on wild menu
set ruler        " Always show current positions along the bottom
set cmdheight=1  " the command bar is 2 high
set number       " turn on line numbers
set lz           " do not redraw while running macros (much faster) (LazyRedraw)
set hid          " you can change buffer without saving
set backspace=2  " make backspace work normal
set report=0     " tell us when anything is changed via :...
set noerrorbells " don't make noise
set fillchars=vert:\ ,stl:\ ,stlnc:\
set guioptions=

" Visual Cues
set showmatch    " show matching brackets
set mat=5        " how many tenths of a second to blink matching brackets for
set hlsearch     " do not highlight searched for phrases
set incsearch    " BUT do highlight as you type you search phrase
set ignorecase
set so=10        " Keep 10 lines (top/bottom) for scope
set visualbell " don't blink
set noerrorbells " no noises
set laststatus=2
set linespace=0
set showcmd
set nowrap
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:< " what to show when I hit :set list
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

" Indent
set fo=tcrqn     " See Help (complex)
set autoindent   " autoindent
set smartindent  " smartindent
set cindent      " do c-style indenting
set smarttab     " use tabs at the start of a line, spaces elsewhere
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0

" Folding
set foldenable        " Turn on folding
set foldmethod=indent " Make folding indent sensitive
set foldlevel=100     " Don't autofold anything (but I can still fold manually)
set foldopen-=search  " don't open folds when you search into them
set foldopen-=undo    " don't open folds when you undo stuff

" 新規ファイル保存時にディレクトリを作成する
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'))
  function! s:auto_mkdir(dir)  " {{{
    if !isdirectory(a:dir)
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

" バッファ保存時に行末の空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge

" 前回終了した場所に戻る
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" コメント行の後の挿入で自動的にコメントしない
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" SQLUtilities
let g:sqlutil_align_comma = 1
nnoremap <Leader>sql :SQLUFormatter<CR>

" syntastics
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_quiet_messages = { "level": "warnings",
      \ "type":  "style",
      \ "regex": 'was used before it was defined', }
let g:syntastic_javascript_checkers = ['eslint']

" quickrun
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}

" NERDTree
nnoremap <silent> tt :NERDTreeToggle<CR>

" ctrlp
set wildignore+=*/.git/*,*/tmp/*,*/.sass-cache/*,log/*,build/*,*/node_modules/*,*/bower_components/*

" neocomplcache
let g:acp_enableAtStartup = 0                           " Disable AutoComplPop.
let g:neocomplcache_enable_at_startup = 1               " Use neocomplcache.
let g:neocomplcache_enable_smart_case = 1               " Use smartcase.
let g:neocomplcache_min_syntax_length = 3               " Set minimum syntax keyword length.
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_select = 1              " AutoComplPop like behavior.

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" TagBar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_coffee = {
\ 'kinds' : [
\   'f:functions',
\   'o:object'
\ ],
\ 'kind2scope' : {
\  'f' : 'object',
\   'o' : 'object'
\},
\ 'sro' : ".",
\ 'ctagsbin' : 'coffeetags',
\ 'ctagsargs' : ' ',
\}
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

" NERDCommenter
map <Leader>x <space>c<space>

" gitv
nnoremap <silent> <C-g> :Gitv!<CR>

" dash
nmap <silent> <leader>d <Plug>DashSearch

" show border on 80 column
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" custom diff
set diffexpr=unified_diff#diffexpr()

" configure with the followings (default values are shown below)
let unified_diff#executable = 'git'
let unified_diff#arguments = [
      \   'diff', '--no-index', '--no-color', '--no-ext-diff', '--unified=0',
      \ ]
let unified_diff#iwhite_arguments = [
      \   '--ignore--all-space',
      \ ]

" vim-node
autocmd User Node setlocal suffixesadd+=.jsx

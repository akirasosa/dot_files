" Bundles
set nocompatible
filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()
Bundle 'vim-scripts/Align'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/neocomplcache'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'edsono/vim-matchit'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'juvenn/mustache.vim'
Bundle 'kana/vim-operator-user'
Bundle 'kana/vim-operator-replace'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/cocoa.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sukima/xmledit'
Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/grep.vim'
Bundle 'xolox/vim-session'
Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'SQLUtilities'
Bundle 'Specky'
Bundle 'php.vim'
Bundle 'sudo.vim'

" key map
imap <C-j> <esc>
let mapleader=" "
nnoremap <C-j><C-j> :nohlsearch<CR>
set pastetoggle=<C-E>
nnoremap <C-g>p `.zz
nnoremap <C-g><C-o> g;
nnoremap <C-g><C-i> g,
nmap _ <Plug>(operator-replace)

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

" Theme/Colors
set t_Co=256
set background=dark
"colorscheme desert
colorscheme xoria256

" Vim UI
set wildmenu     " turn on wild menu
set ruler        " Always show current positions along the bottom
set cmdheight=1  " the command bar is 2 high
set number       " turn on line numbers
set lz           " do not redraw while running macros (much faster) (LazyRedraw)
set hid          " you can change buffer without saving
set backspace=2  " make backspace work normal
set mouse=a      " use mouse everywhere
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
set statusline=%n:\ %<%f\ %m%r%h%w[%{&fileformat}][%{has('multi_byte')&&\ &fileencoding!=''?&fileencoding:&encoding}]\ 0x%B=%b%=%l,%c\ %P
let loaded_matchparen = 1

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

" functions
command Rst :!rst2html.py % > /tmp/rstprev.html && open /tmp/rstprev.html

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

" FuzzyFinder.vim
"let g:fuf_modesDisable = []
"nnoremap <Space>f f
"nnoremap <Space>F F
"nnoremap f <Nop>
"nnoremap <silent> fb :<C-u>FufBuffer!<CR>
"nnoremap <silent> ff :<C-u>FufFile!<C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
"nnoremap <silent> fm :<C-u>FufMruFile!<CR>
"nnoremap <silent> tb :<C-u>tabnew<CR>:tabmove<CR>:FufBuffer!<CR>
"nnoremap <silent> tf :<C-u>tabnew<CR>:tabmove<CR>:FufFile!<C-r>=expand('#:~:.')[:-1-len(expand('#:~:.:t'))]<CR><CR>
"nnoremap <silent> tm :<C-u>tabnew<CR>:tabmove<CR>:FufMruFile!<CR>

" grep.vim
let Grep_Find_Use_Xargs = 0
let Grep_Shell_Quote_Char = '"'
let Grep_Skip_Dirs        = '.svn'
let Grep_Skip_Dirs        = '.git'
let Grep_Skip_Files       = '*.bak *~'
" カーソル下の単語をGrepBufferする
nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>

" SQLUtilities
vmap <silent>sf        <Plug>SQLU_Formatter<CR>
nmap <silent>scl       <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd       <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt      <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp       <Plug>SQLU_CreateProcedure<CR>

" syntastics
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" quickrun
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}

" NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" ctrlp
set wildignore+=*/.git/*,*/tmp/*,*/.sass-cache/*

" neocomplcache
let g:acp_enableAtStartup = 0                           " Disable AutoComplPop.
let g:neocomplcache_enable_at_startup = 1               " Use neocomplcache.
let g:neocomplcache_enable_smart_case = 1               " Use smartcase.
let g:neocomplcache_enable_camel_case_completion = 1    " Use camel case completion.
let g:neocomplcache_enable_underbar_completion = 1      " Use underbar completion.
let g:neocomplcache_min_syntax_length = 3               " Set minimum syntax keyword length.
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_select = 1              " AutoComplPop like behavior.

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

" easymotion
let g:EasyMotion_leader_key = '<Leader>'

" NERDCommenter
map <Leader>x <space>c<space>


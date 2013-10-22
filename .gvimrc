source $VIMRUNTIME/mswin.vim
behave mswin

" grep.vim
" OS dependent
if has("win32")
  let Grep_Path = 'C:\GnuWin32\bin\grep.exe'
  let Fgrep_Path = 'C:\GnuWin32\bin\grep.exe -F'
  let Egrep_Path = 'C:\GnuWin32\bin\grep.exe -E'
  let Grep_Find_Path = 'C:\GnuWin32\bin\find.exe'
  let Grep_Xargs_Path = 'C:\GnuWin32\bin\xargs.exe'
endif
let Grep_Shell_Quote_Char = '"'
let Grep_Skip_Dirs = '.svn'
let Grep_Skip_Dirs = '.bzr'
let Grep_Skip_Files = '*.bak *~'

nmap <C-v> <C-v>
cmap <C-v> <C-v>

nmap <C-a> <C-a>
cmap <C-a> <C-a>

if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Red
endif



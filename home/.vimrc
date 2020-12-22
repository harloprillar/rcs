set nocompatible
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set smartindent
set ls=2            " allways show status line
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case when searching
set title           " show title in console title bar
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
set numberwidth=6
set foldlevelstart=20
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f\ %m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\[%{&fileencoding?&fileencoding:&encoding}\ %{&fileformat}\]
set statusline+=\ \[%l:%c\ %L\ %p%%\]
set statusline+=\ \[%b\]
set statusline+=\ %r\ %m
"set paste

"colorscheme desert
colorscheme elflord
highlight SignColumn ctermbg=234
highlight LineNr ctermfg=240
highlight LineNr ctermbg=234

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'pedrohdz/vim-yaml-folds'
call plug#end()

" Restore cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <F2> :set nonumber \| :IndentLinesDisable \| :set laststatus=0 \| :set noruler \| :set noshowmode \| :set noshowcmd \| :set paste<CR>
nnoremap <F3> :set number \| :IndentLinesEnable \| set laststatus=2 \| set ruler \| :set showmode \| :set showcmd \| :set nopaste<CR>

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_lint_on_text_changed = 'never'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 236
let g:indentLine_char = '|'


" Vimrc file, http://phuzz.org

set nocompatible    " use vim defaults
set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
"set number          " show line numbers
set ignorecase      " ignore case when searching 
"set noignorecase   " don't ignore case
set title           " show title in console title bar
set ttyfast         " smoother changes
"set ttyscroll=0        " turn off scrolling, didn't work well with PuTTY
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set viminfo='20,<50,s10,h

"set autoindent     " always set autoindenting on
"set smartindent        " smart indent
"set cindent            " cindent
set noautoindent
set nosmartindent
set nocindent

"set autowrite      " auto saves changes when quitting and swiching buffer
"set expandtab      " tabs are converted to spaces, use only when required
"set sm             " show matching braces, somewhat annoying...
"set nowrap         " don't wrap lines

syntax on           " syntax highlighing
if has("gui_running")
    " See ~/.gvimrc
    set guifont=Monospace\ 10  " use this font 
    set lines=50       " height = 50 lines
    set columns=100        " width = 100 columns
    set background=light   " adapt colors for background
    set selectmode=mouse,key,cmd
    set keymodel=
else
    colorscheme elflord    " use this color scheme
    set background=dark        " adapt colors for background
endif

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back

    " When using mutt, text width=72
    au FileType mail,tex set textwidth=72
    "au FileType cpp,c,java,sh,pl,php,phtml,asp  set autoindent
    au FileType cpp,c,java,sh,pl,php,phtml,asp,xml,javascript  set smartindent
    nnoremap <C-p> :set invpaste paste?<CR>
    set pastetoggle=<C-p>
    set showmode
    "au FileType cpp,c,java,sh,pl,php,phtml,asp  set cindent
    "au BufRead mutt*[0-9] set tw=72

    " Automatically chmod +x Shell and Perl scripts
    "au BufWritePost   *.sh             !chmod +x %
    "au BufWritePost   *.pl             !chmod +x %

    " File formats
    au BufNewFile,BufRead  *.phtml  set syntax=php
    au BufNewFile,BufRead  *.pls    set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf

    " Ctrl+X O
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete

    autocmd FileType php noremap <C-L> :!php -l %<CR>
    autocmd Filetype html,xml,xsl source ~/.vim/closetag.vim
endif

" Keyboard mappings
map <F1> :previous<CR>  " map F1 to open previous buffer
map <F2> :next<CR>      " map F2 to open next buffer
map <silent> <C-N> :silent noh<CR> " turn off highlighted search
map ,v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
map ,e :e ~/.vimrc<cr>      " edit my .vimrc file
map ,u :source ~/.vimrc<cr> " update the system settings from my vimrc file
"----- write out html file
map ,h :source $VIM/vim70/syntax/2html.vim<cr>:w<cr>:clo<cr>


" Common command line typos
"cmap W w
"cmap Q q

" Keyboard mapping for numeric keypad
imap <Esc>OM <c-m>
 map <Esc>OM <c-m>
imap <Esc>OP <nop>
 map <Esc>OP <nop>
imap <Esc>OQ /
 map <Esc>OQ /
imap <Esc>OR *
 map <Esc>OR *
imap <Esc>OS -
 map <Esc>OS -

imap <Esc>Ol +
imap <Esc>Om -
imap <Esc>On ,
imap <Esc>Op 0
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Oz 0

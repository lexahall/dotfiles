"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible          " No compatibility with vi.
filetype on               " Recognize syntax by file extension.
filetype indent on        " Check for indent file.
filetype plugin on        " Allow plugins to be loaded by file type.

syntax on                 " Syntax highlighting.
syntax enable

set t_Co=256

set background=dark       " Light background for color schemes.
colorscheme monokai       " Monokai color scheme.

set keywordprg=pman       " php man shizzles
set colorcolumn=80
set pastetoggle=<F3>      " map paste to F3
set autowrite             " Write before executing the 'make' command.
set backspace=2           " Allow <BS> to go past last insert.
set expandtab             " Expand tabs with spaces.
set nofoldenable          " Disable folds; toggle with zi.
set gdefault              " Assume :s uses /g.
set ignorecase            " Ignore case in regular expressions
set incsearch             " Immediately highlight search matches.
set modeline              " Check for a modeline.
set noerrorbells          " No beeps on errors.
set nohls                 " Don't highlight all regex matches.
set nowrap                " Don't soft wrap.
set number                " Display line numbers.
set ruler                 " Display row, column and % of document.
set scrolloff=10          " Keep min of 10 lines above/below cursor.
set shiftwidth=2          " >> and << shift 2 spaces.
set showcmd               " Show partial commands in the status line.
set showmatch             " Show matching () {} etc..
set showmode              " Show current mode.
set smartcase             " Searches are case-sensitive if caps used.
set softtabstop=2         " See spaces as tabs.
set tabstop=2             " <Tab> move three characters.
set textwidth=79          " Hard wrap at 79 characters.
set virtualedit=block     " Allow the cursor to go where there's no char.
set list                  " Show invisibles
set listchars=trail:␣

" Live dangerously
set nobackup
set nowritebackup
set noswapfile

"set wildmode=longest,list " Tab completion works like bash.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set some configuration variables.

let loaded_matchparen=1   " Don't do automatic bracket highlighting.
let mapleader=","         " Use , instead of \ for the map leader.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting settings

" t: Auto-wrap text using textwidth. (default)
" c: Auto-wrap comments; insert comment leader. (default)
" q: Allow formatting of comments with "gq". (default)
" r: Insert comment leader after hitting <Enter>.
" o: Insert comment leader after hitting 'o' or 'O' in command mode.
" n: Auto-format lists, wrapping to text *after* the list bullet char.
" l: Don't auto-wrap if a line is already longer than textwidth.
set formatoptions+=ronl

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line cartography

" Stupid shift mistakes.
:command W w
:command Q q

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command mode cartography

" Make Q reformat text.
noremap Q gq

" Toggle paste mode.
noremap <Leader>p :set paste!<CR>

" Open the file under the cursor in a new tab.
noremap <Leader>ot <C-W>gf

" Toggle highlighting of the last search.
noremap <Leader>h :set hlsearch! hlsearch?<CR>

" Open a scratch buffer.
noremap <Leader>s :Scratch<CR>

" Execute an :lcd to the directory of the file being edited.
function LcdToCurrent()
    let dir = expand("%:h")
    execute "lcd " . dir
endfunction
noremap <Leader>cd :call LcdToCurrent()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert mode cartography

" Insert <Tab> or complete identifier if the cursor is after a keyword
" character.
function TabOrComplete()
    let col = col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-N>"
     endif
endfunction
inoremap <Tab> <C-R>=TabOrComplete()<CR>
set complete-=i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Restore the cursor when we can.

function! RestoreCursor()
    if line("'\"") <= line("$")
        normal! g`"
        normal! zz
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stefan - custom commands
"
let g:dbgPavimPort = 9000
let g:dbgPavimBreakAtEntry = 0

command Nuke %s/\s\+$//gc
command JS :set ts=2 sw=2 sts=2 et
command PHP :set ts=2 sw=2 sts=2 et
command PYTHON :set ts=2 sw=2 sts=2 et
command PE :set path=.,,~/Code/../ifixit-eustore/oxid49/**

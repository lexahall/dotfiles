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

set path=./**
set colorcolumn=80
set pastetoggle=<F3>      " map paste to F3
set autowrite             " Write before executing the 'make' command.
set backspace=2           " Allow <BS> to go past last insert.
set expandtab             " Expand tabs with spaces.
set gdefault              " Assume :s uses /g.
set ignorecase            " Ignore case in regular expressions
set smartcase             " Searches are case-sensitive if caps used.
set incsearch             " Immediately highlight search matches.
set nohls                 " Don't highlight all regex matches.
set modeline              " Check for a modeline.
set noerrorbells          " No beeps on errors.
set nowrap                " Don't soft wrap.
set number                " Display line numbers.
set ruler                 " Display row, column and % of document.
set scrolloff=10          " Keep min of 10 lines above/below cursor.
set shiftwidth=2          " >> and << shift 2 spaces.
set softtabstop=2         " See spaces as tabs.
set tabstop=2             " <Tab> move two characters.
set showcmd               " Show partial commands in the status line.
set showmatch             " Show matching () {} etc..
set showmode              " Show current mode.
set textwidth=79          " Hard wrap at 79 characters.
set virtualedit=block     " Allow the cursor to go where there's no char.
set listchars=trail:␣     " Show trailing whitespace char

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

" Open the file under the cursor in a new tab.
noremap <Leader>ot <C-W>gf

" Open a scratch buffer.
noremap <Leader>s :Scratch<CR>

" Execute an :lcd to the directory of the file being edited.
function LcdToCurrent()
    let dir = expand("%:h")
    execute "lcd " . dir
endfunction
noremap <Leader>cd :call LcdToCurrent()<CR>
"
"==========================================
" From: https://gist.github.com/3882918
" Author: Marc Zych
nnoremap <silent> <C-o> :call FindFile()<CR>
nnoremap <silent> <C-q> :find

function! FindFile()
   " Get the word under cursor.
   let cursorWord = expand("<cword>")
   " Get the current file name and keep only the extension.
   let currentFile = expand("%")
   let extPos = strridx(currentFile, ".")

   " Append an extension only if the current file has an extension.
   if extPos != -1
      let extension = strpart(currentFile, extPos)
   else
      let extension = ""
   endif

   " Construct the file name.
   let fileName = cursorWord.extension

   " Open the file in the current buffer.
   execute "Find /".fileName
endfunction
"==========================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"Set custom tab size

command JS :set ts=2 sw=2 sts=2 et
command PHP :set ts=3 sw=3 sts=3 et
command PYTHON :set ts=2 sw=2 sts=2 et


" Allow local overrides
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif

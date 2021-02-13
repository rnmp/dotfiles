set inccommand=split

set number
set relativenumber
filetype plugin indent on
set autoindent
set ignorecase smartcase

set expandtab
set shiftwidth=2
set softtabstop=2
set hidden
set updatetime=300
set conceallevel=0

" https://unix.stackexchange.com/a/383044/406997
set autoread
"au FocusGained,BufEnter,CursorHold,CursorHoldI *
"        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

set splitbelow
set splitright

set clipboard+=unnamedplus
set mouse=vnicr
let Leader=' '

set noshowmode

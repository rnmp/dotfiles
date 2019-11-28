command! Config execute ":e ~/.config/nvim/init.vim"

call plug#begin('~/.vim/plugged')

" Theme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

" Autocompletion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Fuzzy Search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Navigation
Plug 'scrooloose/nerdtree'

" Syntax
Plug 'vim-python/python-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Misc.
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'Yggdroot/indentLine'
Plug 'machakann/vim-highlightedyank'
Plug 'alvan/vim-closetag'
Plug 'aaronbieber/vim-quicktask'
" Plug 'tpope/vim-obsession'

" Snippets
Plug 'SirVer/ultisnips'

call plug#end()

set iskeyword+=^_
set inccommand=split

" TODO
" fix autocomplete direction

let NERDTreeMinimalUI = 1
let NERDTreeStatusline = ' '

syntax on
set termguicolors
colorscheme dracula
hi! Normal ctermbg=NONE guibg=NONE
let g:lightline = {
  \ 'colorscheme': 'dracula',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

set number
set relativenumber
filetype plugin indent on
set smartindent

set expandtab
set shiftwidth=2
set softtabstop=2

set clipboard+=unnamedplus
set mouse=vnicr
let Leader=' '

set noshowmode

let g:NERDTreeWinPos = "right"
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" CONQUEROR OF COMPLETION
"
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-tslint-plugin',
  \ 'coc-python',
  \ 'coc-solargraph',
  \ 'coc-json',
  \ ]
set hidden
set updatetime=300
set conceallevel=0

vmap <C-l> <Plug>(coc-snippets-select)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" /CONQUEROR OF COMPLETION

let g:fzf_action = {
  \ 'right': 'tab split',
  \ 'ctrl-j': 'vsplit' }

" Typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx,typescript.tsx,tsx'

hi tsxTagName guifg=#8be9fd
hi xmlEndTag guifg=#8be9fd
hi tsxOpenString guifg=#8be9fd
hi tsxCloseString guifg=#8be9fd
hi tsxTag guifg=#8be9fd
hi htmlEndTag guifg=#8be9fd
hi htmlTagName guifg=#8be9fd
hi tsxAttrib guifg=#50fa7b

syntax region tsxJsBlock
    \ matchgroup=tsxAttributeBraces start=+\([=]\|\s\)\@<={+
    \ matchgroup=tsxAttributeBraces end=+}\(\s*}\|)\)\@!+
    \ contained
    \ keepend
    \ extend
    \ contains=TOP

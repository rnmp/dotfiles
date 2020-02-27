command! Config execute ":e ~/.config/nvim/init.vim"
command! ArrowToFn execute ":normal! ^ciwfunction/=dwndW"

call plug#begin('~/.vim/plugged')

" Theme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'

" Autocompletion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Fuzzy Search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

" Syntax
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'yuezk/vim-js'
" Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'amadeus/vim-mjml'
" Plug 'mattn/emmet-vim'

Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.tsx, *.mjml"
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx,typescript.tsx,tsx,typescriptreact,mjml'

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Misc.
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'

Plug 'tpope/vim-repeat'
" Plug 'Yggdroot/indentLine'
Plug 'machakann/vim-highlightedyank'
Plug 'aaronbieber/vim-quicktask'
" Plug 'tpope/vim-obsession'

" Snippets
Plug 'SirVer/ultisnips'

" Text Objects "
Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'bps/vim-textobj-python'

" Notational Velocity
Plug 'alok/notational-fzf-vim'
let g:nv_search_paths = ['~/notes']

Plug 'tpope/vim-endwise'

call plug#end()

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
  \ 'coc-emmet',
  \ 'coc-tsserver',
  \ 'coc-pairs',
  \ 'coc-tslint-plugin',
  \ 'coc-python',
  \ 'coc-solargraph',
  \ 'coc-json',
  \ ]
set hidden
set updatetime=300
set conceallevel=0
set autoread

vmap <C-l> <Plug>(coc-snippets-select)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :call CocActionAsync('jumpDefinition', 'vsp')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>qf  <Plug>(coc-fix-current)

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
  \ 'ctrl-j': 'vsplit',
  \ 'ctrl-l': 'split'}

" Typescript
map <Space> <Leader>
map <Tab> >>
map <S-Tab> <<
map! ;; <Esc>

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap ? /\c
map <C-J> :NERDTreeFind<CR>

" Blockers: a bit more useful than TODO
map <C-X> :RgRaw @(B<Bar>b)locker<CR>
map <Leader>x :normal! o@blocker: <Esc>gcc$a

map <Leader>conf :e ~/.config/nvim/init.vim<CR>
map <Leader>st :Gstatus<CR>
map <Leader>co :Gcommit<CR>
map <C-P> :FZF<CR>
map <C-Left> :cp<CR>
map <C-Right> :cn<CR>
map <A-Tab> :Buffers<CR>

set splitbelow
set splitright

" map <C-w>L <C-w>:


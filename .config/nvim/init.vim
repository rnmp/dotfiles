let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

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
au FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

set splitbelow
set splitright

set clipboard+=unnamedplus
set mouse=vnicr
let Leader=' '

set noshowmode

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Typescript
map <Space> <Leader>
" map <Tab> >>
" map <S-Tab> <<

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap ? /\c

" Blockers: a bit more useful than TODO
map <C-X> :RgRaw @(B<Bar>b)locker<CR>
map <Leader>x :normal! o@blocker: <Esc>gcc$a

map <Leader>conf :e ~/.config/nvim/init.vim<CR>
map <C-Left> :cp<CR>
map <C-Right> :cn<CR>
map <A-Tab> :Buffers<CR>
map <Leader>j :normal! Jx<CR>
command! ArrowToFn execute ":normal! ^ciwfunction/=dwndW"
function! SchemaToTypeFn() range
  let @z='^dWf"pDF"wcf.: 0wds"crc'
  silent execute a:firstline . "," . a:lastline . "normal! @z"
  silent execute a:firstline . "," . a:lastline . "s/bigint/number/e"
  silent execute a:firstline . "," . a:lastline . "s/integer/number/e"
  silent execute a:firstline . "," . a:lastline . "s/datetime/string/e"
  let @z=''
endfunction
command! -range SchemaToType <line1>,<line2> call SchemaToTypeFn()

" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

call plug#begin('~/.vim/plugged')

  Plug 'christoomey/vim-tmux-navigator'
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <c-7> :TmuxNavigateLeft<cr>
  nnoremap <silent> <c-8> :TmuxNavigateDown<cr>
  nnoremap <silent> <c-9> :TmuxNavigateUp<cr>
  nnoremap <silent> <c-0> :TmuxNavigateRight<cr>
  nnoremap <silent> <c-+> :TmuxNavigatePrevious<cr>

  " Theme
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'itchyny/lightline.vim'
  let g:lightline = {
    \ 'colorscheme': 'dracula',
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

  " Fuzzy Search
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'jesseleite/vim-agriculture'
  " Plug 'wsdjeg/vim-fetch'

  let g:fzf_action = {
    \ 'right': 'tab split',
    \ 'ctrl-j': 'vsplit',
    \ 'ctrl-l': 'split'}

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
  function! FloatingFZF()
    " let buf = nvim_create_buf(v:false, v:true)
    " call setbufvar(buf, '&signcolumn', 'no')

    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height,
               \ 'style': 'minimal'
               \}
    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:TabLine')
    " call nvim_open_win(buf, v:true, opts)
  endfunction

  " Sidebar
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeStatusline = ' '
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

  map <C-J> :NERDTreeFind<CR>
  map <C-H> :NERDTreeToggle<CR>

  Plug 'rbgrouleff/bclose.vim'
  let g:bclose_no_plugin_maps = 1

  Plug 'brooth/far.vim'

  " Syntax
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'amadeus/vim-mjml'
  Plug 'jparise/vim-graphql'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Misc.
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-abolish'

  Plug 'alvan/vim-closetag'
  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.tsx, *.mjml"
  let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx,typescript.tsx,tsx,typescriptreact,mjml'
  let g:closetag_emptyTags_caseSensitive = 1

  Plug 'tpope/vim-repeat'
  Plug 'machakann/vim-highlightedyank'

  " Snippets
  Plug 'SirVer/ultisnips'

  let g:UltiSnipsExpandTrigger="<c-l>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

  " Text Objects "
  Plug 'tmhedberg/matchit'
  Plug 'kana/vim-textobj-user'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'bps/vim-textobj-python'

  " Notational Velocity
  Plug 'alok/notational-fzf-vim'
  let g:nv_search_paths = ['~/notes']

  Plug 'tpope/vim-endwise'

  " Autocompletion
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  let g:coc_global_extensions = [
    \ 'coc-emmet',
    \ 'coc-tsserver',
    \ 'coc-pairs',
    \ 'coc-tslint-plugin',
    \ 'coc-python',
    \ 'coc-solargraph',
    \ 'coc-json',
    \ 'coc-snippets',
    \ ]

  let g:coc_filetype_map = {
    \ 'tsx': 'typescript.tsx',
    \ }

  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  nmap <leader>rn <Plug>(coc-rename)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gs :call CocActionAsync('jumpDefinition', 'vsp')<CR>
  nmap <silent> gl :call CocActionAsync('jumpDefinition', 'sp')<CR>
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
call plug#end()

syntax on
set termguicolors
colorscheme dracula
hi! Normal ctermbg=NONE guibg=NONE

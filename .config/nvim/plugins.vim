call plug#begin('~/.vim/plugged')

  " UI
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'

  " Theme
  Plug 'arcticicestudio/nord-vim'

  " Fuzzy Search
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'jesseleite/vim-agriculture' " :RgRaw

  " Syntax
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'amadeus/vim-mjml'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Misc.
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-endwise'

  Plug 'alvan/vim-closetag'
  Plug 'machakann/vim-highlightedyank'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'christoomey/vim-tmux-navigator'

  " Snippets
  Plug 'SirVer/ultisnips'

  " Text Objects
  Plug 'tmhedberg/matchit'
  Plug 'kana/vim-textobj-user'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'bps/vim-textobj-python'

  " Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" tmux_navigator.vim
let g:tmux_navigator_no_mappings = 1

" bclose.vim
let g:bclose_no_plugin_maps = 1

" closetag.vim
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.tsx, *.mjml"
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx,typescript.tsx,tsx,typescriptreact,mjml'
let g:closetag_emptyTags_caseSensitive = 1

" NERD_tree.vim
let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ' '
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=['\node_modules$']
let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ "Modified"  : "~",
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

" fzf.vim
let g:fzf_action = {
      \ 'right': 'tab split',
      \ 'ctrl-j': 'vsplit',
      \ 'ctrl-l': 'split'}
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
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
endfunction

" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'inactive': {
      \   'left': [['readonly', 'relativepath', 'modified']],
      \   'right': [['percent'], ['lineinfo']]
      \ },
      \ 'active': {
      \   'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified']],
      \   'right': [['percent'], ['lineinfo'], ['filetype']]
      \ },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" coc.vim
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier']

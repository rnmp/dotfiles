call plug#begin('~/.vim/plugged')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " UI
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'

  " Theme
  Plug 'chrisbra/Colorizer'
  Plug 'cocopon/inspecthi.vim'
  Plug 'rnmp/nord-vim'

  " Fuzzy Search
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'jesseleite/vim-agriculture' " :RgRaw
  Plug 'eugen0329/vim-esearch'

  " Syntax
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'amadeus/vim-mjml'
  Plug 'keith/swift.vim'
  Plug 'elixir-editors/vim-elixir'

  " Writing
  Plug 'Delayless/bullets.vim' " this is a fork
  Plug 'junegunn/goyo.vim'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'inkarkat/vim-ingo-library' " Dependency for CountJump
  Plug 'inkarkat/vim-CountJump' " Dependency for ConflictMotions
  Plug 'inkarkat/vim-ConflictMotions'

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

  " Text Objects
  Plug 'tmhedberg/matchit'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-function'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'bps/vim-textobj-python'
  Plug 'haya14busa/vim-textobj-function-syntax'

  " Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'pechorin/any-jump.vim'

  " Notes
  Plug 'ferrine/md-img-paste.vim'
call plug#end()

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

" NERD_tree.vim
let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ' '

" tmux_navigator.vim
let g:tmux_navigator_no_mappings = 1

" bclose.vim
let g:bclose_no_plugin_maps = 1

" closetag.vim
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.tsx, *.mjml"
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx,typescript.tsx,tsx,typescriptreact,mjml'
let g:closetag_emptyTags_caseSensitive = 1

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

" coc.vim
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-go', 'coc-sourcekit']

" netrw.vim
let g:netrw_banner = 0

" Markdown
let g:markdown_fenced_languages = ['typescript', 'typescriptreact', 'ruby']

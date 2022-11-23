map <space> <leader>

" Open conf easily
map <silent><Leader>conf :e ~/.config/nvim/init.vim<CR>
map <silent><Leader>cp :e ~/.config/nvim/plugins.vim<CR>
map <silent><Leader>ca :e ~/.config/nvim/appearance.vim<CR>
map <silent><Leader>cm :e ~/.config/nvim/mappings.vim<CR>
map <silent><Leader>ct :e ~/.tmux.conf<CR>
map <silent><Leader>cf :e ~/.config/zsh/fzf.zsh<CR>

" Writing
map <silent><Leader>ww :Goyo<bar> highlight StatusLineNC ctermfg=100 <bar> highlight EndOfBuffer ctermfg=100<CR>

" Split resizing
if bufwinnr(1)
  map + 10<C-W>>
  map _ 10<C-W><
endif

" Closing shortcuts
map <silent><C-q>w :q<CR>
map <silent><C-q>q :qall<CR>
map <silent><C-q>fq :qall!<CR>

" Clear search highlight
map <silent><C-l> :noh<CR>

" Search current selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Case-insensitive search
nnoremap ? /\c

" Easy navigation in quickfix lists
map <silent><C-]> :cn<CR>
map <silent><C-[> :cp<CR>

" Shortcuts for @blockers
nmap <silent> <C-X> :Telescope live_grep @blocker<CR>
nmap <silent> <Leader>x :normal! o@blocker: <Esc>gcc$a

" tmux_navigator.vim
nnoremap <silent> <c-7> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-8> :TmuxNavigateDown<cr>
nnoremap <silent> <c-9> :TmuxNavigateUp<cr>
nnoremap <silent> <c-0> :TmuxNavigateRight<cr>
nnoremap <silent> <c-+> :TmuxNavigatePrevious<cr>

" NERD_tree.vim
map <silent> <c-j> :vs %:h<CR>

" bclose.vim
nmap <silent> <C-b> :Bclose<CR>
imap <silent> <C-b> <Esc>:Bclose<CR>

" fzf.vim
nmap <silent> <A-Tab> :Telescope buffers<CR>
imap <silent> <A-Tab> <Esc>:Telescope buffers<CR>

" fugitive.vim
nmap <silent> <C-s> :Gstatus<CR>
imap <silent> <C-s> <Esc>:Gstatus<CR>
nmap <silent> <C-g> :Git ci<CR>
imap <silent> <C-g> <Esc>:Git ci<CR>

" coc.vim
"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rn  <Plug>(coc-rename)
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() :
        \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" Easy restart
command! CR execute ":CocRestart"
"
" Open definition on side split
nmap <silent> gs :call CocActionAsync('jumpDefinition', 'vsp')<CR>
"
" Open definition on bottom split
nmap <silent> gl :call CocActionAsync('jumpDefinition', 'sp')<CR>
"
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" unmap <Esc>

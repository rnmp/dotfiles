map <space> <leader>

" Open conf easily
map <Leader>conf :e ~/.config/nvim/init.vim<CR>

" Split resizing
if bufwinnr(1)
  map + 10<C-W>>
  map _ 10<C-W><
endif

" Search current selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Case-insensitive search
nnoremap ? /\c

" Easy navigation in quickfix lists
map <silent><C-]> :cn<CR>
map <silent><C-[> :cp<CR>

" Shortcuts for @blockers
nmap <silent> <C-X> :RgRaw @(B<Bar>b)locker<CR>
nmap <silent> <Leader>x :normal! o@blocker: <Esc>gcc$a

" tmux_navigator.vim
nnoremap <silent> <c-7> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-8> :TmuxNavigateDown<cr>
nnoremap <silent> <c-9> :TmuxNavigateUp<cr>
nnoremap <silent> <c-0> :TmuxNavigateRight<cr>
nnoremap <silent> <c-+> :TmuxNavigatePrevious<cr>

" NERD_tree.vim
map <silent> <c-j> :NERDTreeFind<CR>
map <silent> <c-h> :NERDTreeToggle<CR>

" bclose.vim
nmap <silent> <C-b> :Bclose<CR>
imap <silent> <C-b> <Esc>:Bclose<CR>

" fzf.vim
nmap <silent> <C-f> :Rg<CR>
imap <silent> <C-f> <Esc>:Rg<CR>
nmap <silent> <C-p> :FZF<CR>
imap <silent> <C-p> <Esc>:FZF<CR>
nmap <silent> <A-Tab> :Buffers<CR>
imap <silent> <A-Tab> <Esc>:Buffers<CR>

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

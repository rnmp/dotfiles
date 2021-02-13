map <Space> <Leader>

nnoremap <silent> <c-7> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-8> :TmuxNavigateDown<cr>
nnoremap <silent> <c-9> :TmuxNavigateUp<cr>
nnoremap <silent> <c-0> :TmuxNavigateRight<cr>
nnoremap <silent> <c-+> :TmuxNavigatePrevious<cr>

map <C-J> :NERDTreeFind<CR>
map <C-H> :NERDTreeToggle<CR>

" Shortcuts for @blockers
map <C-X> :RgRaw @(B<Bar>b)locker<CR>
map <Leader>x :normal! o@blocker: <Esc>gcc$a

" Open conf easily
map <Leader>conf :e ~/.config/nvim/init.vim<CR>
map <C-Left> :cp<CR>
map <C-Right> :cn<CR>
map <A-Tab> :Buffers<CR>
map <Leader>j :normal! Jx<CR>
command! ArrowToFn execute ":normal! ^ciwfunction/=dwndW"
command! CR execute ":CocRestart"

" quick split resizing
if bufwinnr(1)
  map + 10<C-W>>
  map _ 10<C-W><
endif

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap ? /\c

" Easy navigation in quickfix lists
map <silent><C-]> :cn<CR>
map <silent><C-[> :cp<CR>


" coc
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :call CocActionAsync('jumpDefinition', 'vsp')<CR>
nmap <silent> gl :call CocActionAsync('jumpDefinition', 'sp')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

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

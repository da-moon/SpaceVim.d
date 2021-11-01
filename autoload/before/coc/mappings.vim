function! before#coc#mappings#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  " ─────────────────────────────────────────────────────────────────────
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  nnoremap <silent> Q :call SpaceVim#mapping#SmartClose()<CR>
  inoremap <silent><expr> <c-space> coc#refresh()
" ─────────────────────────────────────────────────────────────────────
  if exists(':ShowDoc')
    call SpaceVim#logger#info(l:base_log_msg.'"ShowDoc" command exists. setting autocmd and mapping')
    call SpaceVim#custom#SPC('nore', ['C', 'h'], 'ShowDoc', 'Show current symbol help', 1)
  endif
" ─────────────────────────────────────────────────────────────────────
  if exists(':CocActionAsync')
    call SpaceVim#logger#info(l:base_log_msg.'"CocActionAsync" command exists. setting autocmd and mapping')
    autocmd CursorHold * silent call CocActionAsync('highlight')
    nnoremap <silent> K :call CocActionAsync('doHover')<CR>
  endif
" ─────────────────────────────────────────────────────────────────────
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif
endfunction
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

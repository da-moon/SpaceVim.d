function! before#coc#lang#python#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  if executable('python')
    call add(g:coc_global_extensions,'coc-python')
    call add(g:coc_filetypes,'python')
  end
endfunction

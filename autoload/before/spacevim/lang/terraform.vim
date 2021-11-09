function! before#spacevim#lang#terraform#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  if executable('terraform')
    call add(g:enabled_clients,'terraformls')
    if executable('tflint')
      call add(g:enabled_clients,'tflint')
    endif
  endif
endfunction

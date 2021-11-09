function! before#spacevim#lang#yaml#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  call add(g:enabled_clients,'yamlls')
  if executable('ansible')
    call add(g:enabled_clients,'ansiblels')
  endif
endfunction

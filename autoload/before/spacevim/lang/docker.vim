function! before#spacevim#lang#docker#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  if executable('docker')
    let g:spacevim_layers['lang#dockerfile']={}
  endif
endfunction

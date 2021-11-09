function! before#spacevim#lang#ruby#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  if executable('ruby')
    let g:spacevim_layers['lang#ruby']={}
    call add(g:enabled_clients,'solargraph')
  end
endfunction

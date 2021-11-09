function! before#spacevim#lang#python#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  if executable('python')
    let g:spacevim_layers['lang#python']={}
    call add(g:enabled_clients,'pylsp')
  end
endfunction

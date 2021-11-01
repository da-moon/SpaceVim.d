function! before#spacevim#format#init#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')

  let g:spacevim_layers['format']={
    \ 'format_on_save' : 'true',
  \ }
endfunction

function! before#spacevim#gtags#init#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:spacevim_layers['gtags']={
    \ 'gtagslabel' : 'ctags',
  \ }
endfunction

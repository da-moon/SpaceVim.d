function! before#spacevim#autocomplete#init#load() abort
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:spacevim_layers['autocomplete']={
    \ 'autocomplete_method' : 'coc',
    \ 'auto_completion_return_key_behavior' : 'complete',
    \ 'auto_completion_tab_key_behavior': 'smart' ,
  \ }
endfunction

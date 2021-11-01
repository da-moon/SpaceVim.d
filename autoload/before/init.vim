function! before#init#load() abort
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  call before#spacevim#init#load()
  call before#coc#init#load()
  call before#telescope#init#load()
endfunction


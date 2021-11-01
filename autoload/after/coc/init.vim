function! after#coc#init#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  call coc#config('coc.preferences', g:coc_preferences)
  call coc#config('languageserver', g:coc_languageserver)
endfunction

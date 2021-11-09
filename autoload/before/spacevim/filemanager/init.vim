
function! before#spacevim#filemanager#init#load() abort
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  " ─────────────────────────────────────────────────────────────────────
  if has('nvim')
   call before#spacevim#filemanager#chadtree#load()
  else
   call before#spacevim#filemanager#coc_explorer#load()
  end
endfunction

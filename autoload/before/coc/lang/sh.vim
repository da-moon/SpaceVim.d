function! before#coc#lang#sh#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  if executable('sh')
    call add(g:coc_global_extensions,'coc-sh')
    let g:coc_languageserver['bash']={
    \  "command": "bash-language-server",
    \  "args": ["start"],
    \  "filetypes": ["sh"],
    \  "ignoredRootPaths": ["~"]
    \ }
  end
endfunction

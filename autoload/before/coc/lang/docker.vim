function! before#coc#lang#docker#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  if executable('docker')
    call add(g:coc_global_extensions,'coc-docker')
    let g:coc_languageserver['docker']={
      \   'command': exepath('docker-langserver'),
      \   'args': ['--stdio'],
      \   'filetypes': ['dockerfile']
    \ }
  end
endfunction

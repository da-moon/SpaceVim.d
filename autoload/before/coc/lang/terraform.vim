function! before#coc#lang#terraform#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  if executable('terraform-ls')
    call SpaceVim#logger#info(l:base_log_msg.'terraform language server binary detected')
      let g:coc_languageserver['terraform']={
      \   "command": "terraform-ls",
      \   "args": ["serve"],
      \   "filetypes": ["terraform","tf"],
      \   "initializationOptions": {},
      \   "settings": {}
      \ }
    endif
endfunction

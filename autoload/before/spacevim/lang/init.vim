function! before#spacevim#lang#init#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  call before#spacevim#lang#docker#load()
  call before#spacevim#lang#go#load()
  call before#spacevim#lang#justfile#load()
  call before#spacevim#lang#python#load()
  call before#spacevim#lang#ruby#load()
  call before#spacevim#lang#rust#load()
  call before#spacevim#lang#sh#load()
endfunction

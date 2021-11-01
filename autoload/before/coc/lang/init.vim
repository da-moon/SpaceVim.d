function! before#coc#lang#init#load() abort
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  " ─────────────────────────────────────────────────────────────────────
  call before#coc#lang#docker#load()
  call before#coc#lang#go#load()
  call before#coc#lang#json#load()
  call before#coc#lang#markdown#load()
  call before#coc#lang#python#load()
  call before#coc#lang#rust#load()
  call before#coc#lang#sh#load()
  call before#coc#lang#terraform#load()
  call before#coc#lang#yaml#load()
endfunction

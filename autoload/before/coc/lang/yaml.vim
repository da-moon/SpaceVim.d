function! before#coc#lang#yaml#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  
  call add(g:coc_global_extensions,'coc-yaml')
  call SpaceVim#custom#LangSPCGroupName('yaml', ['C'], '+Coc-yaml')
endfunction

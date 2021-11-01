function! before#coc#lang#json#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  call add(g:coc_global_extensions,'coc-json')
  call add(g:coc_global_extensions,'coc-format-json')
  call SpaceVim#custom#LangSPCGroupName('json', ['C'], '+Coc-json')
  call SpaceVim#custom#LangSPC('json','nore', ['C','f'], 'CocCommand formatJson --quote-as-needed --indent=2 --quote="', 'Formats whole JSON file', 1)
  call SpaceVim#custom#LangSPC('json','nore', ['C','v'], 'CocCommand formatJson.selected --quote-as-needed --indent=2 --quote="', 'Format selected text', 1)
endfunction
" call SpaceVim#custom#SPCGroupName(['C','j'], '+Coc-json')
" call SpaceVim#custom#SPC('nore', ['C', 'j','f'], 'CocCommand formatJson --quote-as-needed --indent=2 --quote="', 'Formats whole JSON file', 1)
" call SpaceVim#custom#SPC('nore', ['C', 'j','v'], 'CocCommand formatJson.selected --quote-as-needed --indent=2 --quote="', 'Format selected text', 1)

function! before#coc#list#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  call SpaceVim#custom#SPC('nore', ['C', 'l'], 'CocList', 'Show CocList',1)
  call SpaceVim#custom#SPC('nore', ['C', 'o'], 'CocList outline', 'Buffer symbols outline', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'e'], 'CocList extensions', 'List coc-extensions', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'c'], 'CocList commands', 'Open fuzzy coc-commands search', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'y'], 'CocList -A --normal yank', 'Open yank fuzzy search', 1)
endfunction

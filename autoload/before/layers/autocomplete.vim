function! before#layers#autocomplete#bootstrap()
  call SpaceVim#logger#info("[ before#layers#autocomplete# ] function called.")
  let g:spacevim_layers['autocomplete']={
    \ 'autocomplete_method' : 'coc',
    \ 'auto_completion_return_key_behavior' : 'complete',
    \ 'auto_completion_tab_key_behavior': 'smart' ,
  \ }
  call before#layers#autocomplete#coc()
endfunction
function! before#layers#autocomplete#coc()
  call SpaceVim#logger#info("[ before#layers#autocomplete#coc ] function called.")
  call SpaceVim#custom#SPC('nore', ['C', 'h'], 'ShowDoc', 'Show current symbol help', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'r'], 'Refactor', 'Open coc-refactor window', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'n'], 'RenameSym', 'Rename cword symbol', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'R'], 'CocCommand workspace.renameCurrentFile', 'Rename current file ,update imports', 1)
  call before#layers#autocomplete#list()
  call before#layers#autocomplete#refactor()
endfunction
function! before#layers#autocomplete#list()
  call SpaceVim#logger#info("[ before#layers#autocomplete#list ] function called.")
  call SpaceVim#custom#SPC('nore', ['C', 'l'], 'CocList', 'Show CocList',1)
  call SpaceVim#custom#SPC('nore', ['C', 'o'], 'CocList outline', 'Buffer symbols outline', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'e'], 'CocList extensions', 'List coc-extensions', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'c'], 'CocList commands', 'Open fuzzy coc-commands search', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'y'], 'CocList -A --normal yank', 'Open yank fuzzy search', 1)
endfunction
function! before#layers#autocomplete#refactor()
  call SpaceVim#logger#info("[ before#layers#autocomplete#refactor ] function called.")
  " https://github.com/rohit-s8/SpaceVim.d/blob/master/before.vim
  for ft in g:coc_filetypes
    call SpaceVim#custom#LangSPCGroupName(ft, ['C','r'], '+Code Refactor')
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['C' ,'r', 'n'], '<plug>(coc-rename)', 'Rename Symbol', 0)
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['C','r', 'R'], '<plug>(coc-refactor)', 'Refactor', 0)
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['C','r', 'i'], 'call CocActionAsync("organizeImport")', 'Sort imports', 1)
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['C','a'], '<plug>(coc-codeaction)', 'Show Available Actions', 0)
  endfor
endfunction


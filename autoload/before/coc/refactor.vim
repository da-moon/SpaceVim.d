function! before#coc#refactor#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  call SpaceVim#custom#SPC('nore', ['C', 'R'], 
    \ 'CocCommand workspace.renameCurrentFile', 
    \ 'Rename current file ,update imports', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'r'], 'Refactor', 'Open coc-refactor window', 1)
  " FIXME is this needed
  call SpaceVim#custom#SPC('nore', ['C', 'n'], 'RenameSym', 'Rename cword symbol', 1)
  " https://github.com/rohit-s8/SpaceVim.d/blob/master/before.vim
  for ft in g:coc_filetypes
    call SpaceVim#custom#LangSPCGroupName(ft, ['C','r'], '+Code Refactor')
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['C' ,'r', 'n'], '<plug>(coc-rename)', 'Rename Symbol', 0)
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['C','r', 'R'], '<plug>(coc-refactor)', 'Refactor', 0)
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['C','r', 'i'], 'call CocActionAsync("organizeImport")', 'Sort imports', 1)
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['C','a'], '<plug>(coc-codeaction)', 'Show Available Actions', 0)
  endfor
endfunction

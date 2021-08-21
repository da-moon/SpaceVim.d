function! before#layers#autocomplete#bootstrap()
    call SpaceVim#logger#info("[ before#layers#autocomplete# ] function called.")
    call add(g:spacevim_layers,'autocomplete')
  " let g:spacevim_autocomplete_method = "coc"
  " let g:spacevim_auto_completion_return_key_behavior = "complete"
  " let g:spacevim_auto_completion_tab_key_behavior = "smart"
    call SpaceVim#layers#autocomplete#set_variable({
      \ 'autocomplete_method' : 'coc',
      \ 'auto_completion_return_key_behavior' : 'complete',
      \ 'auto_completion_tab_key_behavior':'smart' ,
    \ })
    call before#layers#autocomplete#coc()
endfunction
function! before#layers#autocomplete#coc()
  call SpaceVim#logger#info("[ before#layers#autocomplete#coc ] function called.")
  call SpaceVim#logger#info("[ before#layers#autocomplete#coc ] binding coc-nvim group to 'C'.")
  call SpaceVim#custom#SPCGroupName(['C'], '+Coc-nvim')
  call SpaceVim#custom#SPC('nore', ['C', 'h'], 'ShowDoc', 'Show current symbol help', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'r'], 'Refactor', 'Open coc-refactor window', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'n'], 'RenameSym', 'Rename cword symbol', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'R'], 'CocCommand workspace.renameCurrentFile', 'Rename current file ,update imports', 1)
  
  call before#layers#autocomplete#json()
  call before#layers#autocomplete#list()
  call before#layers#autocomplete#refactor()
endfunction
function! before#layers#autocomplete#json()
  call SpaceVim#logger#info("[ before#layers#autocomplete#json ] function called.")
  call SpaceVim#logger#info("[ before#layers#autocomplete#json ] setting coc-json key bindings.")
  call SpaceVim#custom#SPCGroupName(['C','j'], '+Coc-json')
  call SpaceVim#logger#info("[ before#layers#autocomplete#json ] setting coc-format-json key bindings.")
  call SpaceVim#custom#SPC('nore', ['C', 'j','f'], 'CocCommand formatJson --quote-as-needed --indent=2 --quote="', 'Formats whole JSON file', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'j','v'], 'CocCommand formatJson.selected --quote-as-needed --indent=2 --quote="', 'Format selected text', 1)
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
    call SpaceVim#custom#LangSPCGroupName(ft, ['r'], '+Code Refactor')
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['r', 'n'], '<plug>(coc-rename)', 'Rename Symbol', 0)
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['r', 'R'], '<plug>(coc-refactor)', 'Refactor', 0)
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['r', 'i'], 'call CocActionAsync("organizeImport")', 'Sort imports', 1)
    call SpaceVim#custom#LangSPC(ft, 'nmap', ['a'], '<plug>(coc-codeaction)', 'Show Available Actions', 0)
  endfor
endfunction


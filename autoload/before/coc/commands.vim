function! before#coc#commands#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  command! -nargs=0 Format :call CocActionAsync('format')
  command! -nargs=0 Refactor :call CocActionAsync('refactor')
  command! -nargs=? Fold :call CocActionAsync('fold', <f-args>)
  command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')
  command! -nargs=0 RenameSym :call CocActionAsync('rename')
  command! -nargs=0 ShowDoc :call CocAction('doHover')
  command! -nargs=0 CodeAction :call CocAction('codeAction')
endfunction

function! after#coc#setup#bootstrap()
  call SpaceVim#logger#info("[ after#coc#setup#bootstrap ] function called.")
  call coc#config('coc.preferences', g:coc_preferences)
  call coc#config('languageserver', g:coc_languageserver)
endfunction
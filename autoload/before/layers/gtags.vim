function! before#layers#gtags#bootstrap()
  call SpaceVim#logger#info("[ before#layers#gtags#bootstrap ] function called.")
  call SpaceVim#layers#gtags#set_variable({
    \ 'gtagslabel' : 'ctags',
  \ })
  " let g:spacevim_gtagslabel = "ctags"
endfunction

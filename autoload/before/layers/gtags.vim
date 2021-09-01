function! before#layers#gtags#bootstrap()
  call SpaceVim#logger#info("[ before#layers#gtags#bootstrap ] function called.")
  let g:spacevim_layers['gtags']={
    \ 'gtagslabel' : 'ctags',
  \ }
endfunction

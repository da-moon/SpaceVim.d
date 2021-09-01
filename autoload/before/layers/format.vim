function! before#layers#format#bootstrap()
  call SpaceVim#logger#info("[ before#layers#format#bootstrap ] function called.")
  let g:spacevim_layers['format']={
    \ 'format_on_save' : 'true',
  \ }
endfunction

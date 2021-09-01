function! before#layers#shell#bootstrap()
  call SpaceVim#logger#info("[ before#layers#shell#bootstrap ] function called.")
  let g:spacevim_layers['shell']={
    \ 'default_position' : 'bottom',
    \ 'default_height' : 20,
  \ }
endfunction

function! before#layers#shell#bootstrap()
  call SpaceVim#logger#info("[ before#layers#shell#bootstrap ] function called.")
  call add(g:spacevim_layers,'shell')
  " call add(g:spacevim_layers,'shell')
  call SpaceVim#layers#shell#set_variable({
    \ 'default_position' : 'bottom',
    \ 'spacevim_default_height' : 20,
  \ })
endfunction

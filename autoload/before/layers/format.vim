function! before#layers#format#bootstrap()
  call SpaceVim#logger#info("[ before#layers#format#bootstrap ] function called.")
  call add(g:spacevim_layers,'format')
  call SpaceVim#layers#format#set_variable({
    \ 'format_on_save' : 'true',
  \ })
endfunction

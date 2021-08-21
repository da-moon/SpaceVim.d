function! before#lang#python#bootstrap()
  call SpaceVim#logger#info("[ before#lang#python#bootstrap ] function called.")
  if executable('python')
    call SpaceVim#logger#info("[ before#spacevim#python#bootstrap ] python detected.adding associated plugins and configuration.")
    call add(g:spacevim_layers,'lang#python')
    call add(g:coc_extensions,'coc-python')
    call add(g:coc_filetypes,'python')
  end
endfunction

function! before#lang#ruby#bootstrap()
  call SpaceVim#logger#info("[ before#lang#ruby#bootstrap ] function called.")
  if executable('ruby')
    call SpaceVim#logger#info("[ before#spacevim#ruby#bootstrap ] ruby detected.adding associated plugins and configuration.")
    let g:spacevim_layers['lang#ruby']={}
  end
endfunction

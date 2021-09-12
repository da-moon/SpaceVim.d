function! before#lang#yaml#bootstrap()
  call SpaceVim#logger#info("[ before#lang#yaml#bootstrap ] function called.")
  let g:spacevim_layers['lang#yaml']={}
  call add(g:coc_extensions,'coc-yaml')
  call SpaceVim#custom#LangSPCGroupName('yaml', ['C','y'], '+Coc-yaml')
endfunction

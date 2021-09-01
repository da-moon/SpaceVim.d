function! before#lang#docker#bootstrap()
  call SpaceVim#logger#info("[ before#lang#docker#bootstrap ] function called.")
  if executable('docker')
    call SpaceVim#logger#info("[ before#spacevim#docker#bootstrap ] docker detected.adding associated plugins and configuration.")
    call add(g:coc_extensions,'coc-docker')
    let g:spacevim_layers['lang#dockerfile']={}
    let g:coc_languageserver['docker']={
      \   'command': exepath('docker-langserver'),
      \   'args': ['--stdio'],
      \   'filetypes': ['dockerfile']
    \ }
  end
endfunction

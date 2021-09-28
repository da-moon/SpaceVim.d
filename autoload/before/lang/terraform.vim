function! before#lang#terraform#bootstrap()
  call SpaceVim#logger#info('[ before#lang#terraform#bootstrap ] function called.')
  if executable('terraform')
    call add(g:spacevim_custom_plugins,['hashivim/vim-terraform',{ 'on_ft' :  ['tf','tfvars','terraform']}])
    if executable('terraform-ls')
      let g:coc_languageserver['terraform']={
      \   "command": "terraform-ls",
      \   "args": ["serve"],
      \   "filetypes": ["terraform","tf"],
      \   "initializationOptions": {},
      \   "settings": {}
      \ }
    endif
  endif
endfunction
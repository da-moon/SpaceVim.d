function! before#lang#sh#bootstrap()
  call SpaceVim#logger#info('[ before#lang#sh#bootstrap ] function called.')
    if executable('sh')
      let g:spacevim_layers['lang#sh']={}
      call add(g:coc_global_extensions,'coc-sh')
      let g:lsp_servers['sh']='bash-language-server'
      let g:coc_languageserver['bash']={
      \  "command": "bash-language-server",
      \  "args": ["start"],
      \  "filetypes": ["sh"],
      \  "ignoredRootPaths": ["~"]
      \ }
    end
endfunction

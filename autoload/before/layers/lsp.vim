function! before#layers#lsp#bootstrap()
  call SpaceVim#logger#info("[ before#layers#lsp#bootstrap ] function called.")
  let filetypes = []
  for lang in keys(g:lsp_servers)
    if executable(g:lsp_servers[lang])
      call add(filetypes, lang)
    endif
  endfor
  let g:spacevim_layers['lsp']={
    \ 'filetypes' : filetypes,
    \ 'override_cmd' : g:lsp_override_cmd,
  \ }
endfunction

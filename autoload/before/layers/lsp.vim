function! before#layers#lsp#bootstrap()
  call SpaceVim#logger#info("[ before#layers#lsp#bootstrap ] function called.")
  call add(g:spacevim_layers,'lsp')
  call before#layers#lsp#servers()
  call before#layers#lsp#override_cmd()
endfunction
function! before#layers#lsp#servers()
  call SpaceVim#logger#info("[ before#layers#lsp#servers ] function called.")
  let filetypes = []
  for lang in keys(g:lsp_servers)
    if executable(g:lsp_servers[lang])
      call add(filetypes, lang)
    endif
  endfor
  call SpaceVim#layers#lsp#set_variable({
    \ 'filetypes' : filetypes,
  \ })
endfunction
function! before#layers#lsp#override_cmd()
  call SpaceVim#logger#info("[ before#layers#lsp#override_cmd ] function called.")
  call SpaceVim#layers#lsp#set_variable({
    \ 'override_cmd' : g:lsp_override_cmd,
  \ })
endfunction
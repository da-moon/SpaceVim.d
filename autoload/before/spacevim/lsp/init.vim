function! before#spacevim#lsp#init#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let filetypes = []
  for lang in keys(g:lsp_servers)
    if executable(g:lsp_servers[lang])
      call add(filetypes, lang)
    endif
  endfor
  call SpaceVim#logger#info(l:base_log_msg.'supported lsp layer file types : '.string(filetypes))
  call SpaceVim#logger#info(l:base_log_msg.'supported lsp layer override_cmd : '.string(g:lsp_override_cmd))
  let g:spacevim_layers['lsp']={
    \ 'filetypes' : filetypes,
    \ 'override_cmd' : g:lsp_override_cmd,
  \ }
endfunction

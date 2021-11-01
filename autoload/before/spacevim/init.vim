let g:spacevim_custom_plugins = []
let g:spacevim_layers={}
let g:lsp_servers = {}
let g:lsp_override_cmd={}
" ─────────────────────────────────────────────────────────────────────
function! before#spacevim#init#load() abort
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  " [ NOTE ] ensures primary custom plugins ans SPC layers are loaded
  call before#spacevim#plugins#init#load()
  " ─────────────────────────────────────────────────────────────────────
  call before#spacevim#autocomplete#init#load()
  call before#spacevim#checkers#init#load()
  call before#spacevim#filemanager#init#load()
  call before#spacevim#format#init#load()
  call before#spacevim#gtags#init#load()
  call before#spacevim#shell#init#load()
  call before#spacevim#ui#init#load()
  call before#spacevim#lang#init#load()
  " [ NOTE ] load lsp layer after all layers are loaded as other layers
  " may modify it's config
  call before#spacevim#lsp#init#load()
  " ─────────────────────────────────────────────────────────────────────
  for layer in keys(g:spacevim_layers)
    call SpaceVim#logger#info(l:base_log_msg.'loading "' . layer . '" spacevim layer')
    let l:config=g:spacevim_layers[layer]
    call SpaceVim#layers#load(layer,l:config)
  endfor
endfunction


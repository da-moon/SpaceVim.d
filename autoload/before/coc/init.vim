let g:coc_preferences = {
  \ 'autoTrigger': 'always',
  \ 'maxCompleteItemCount': 10,
  \ 'codeLens.enable': 1,
  \ 'diagnostic.virtualText': 1,
\}
let g:coc_languageserver={}
let g:coc_filetypes=[]
" ─────────────────────────────────────────────────────────────────────
let g:coc_start_at_startup    = 1
let g:coc_force_debug = 1
let g:coc_disable_startup_warning = 1
let g:UltiSnipsExpandTrigger = "<nop>"
" ─────────────────────────────────────────────────────────────────────
function! before#coc#init#load() abort
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  " ─────────────────────────────────────────────────────────────────────
  call SpaceVim#logger#info(l:base_log_msg."binding coc-nvim group to 'C'.")
  call SpaceVim#custom#SPCGroupName(['C'], '+Coc-nvim')
  " ─────────────────────────────────────────────────────────────────────
  call before#coc#extensions#load()
  " [ NOTE ] => it's best to load language specific configuration early on
  call before#coc#lang#init#load()
  call before#coc#list#load()
  call before#coc#commands#load()
  call before#coc#mappings#load()
  " [ NOTE ] => must be loaded after loading language specific configs
  call before#coc#refactor#load()
endfunction


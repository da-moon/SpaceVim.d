" https://github.com/unlackingc/myDevEnv/blob/master/vim/go.vim
function! before#coc#lang#go#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')

  if executable('go')
    call SpaceVim#logger#info(l:base_log_msg.'go toolchain detected. Adding associated vim plugin and configuration')
    call add(g:coc_global_extensions,'coc-go')
    call add(g:coc_filetypes,'go')
    let g:coc_preferences['go.testFlags']=[
      \ '-v',
      \ '-timeout',
      \ '5m',
    \]
    call before#coc#lang#go#gopls()
    call before#coc#lang#go#linter()
  end
endfunction
function! before#coc#lang#go#gopls()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  
  if executable('gopls')
    call SpaceVim#logger#info(l:base_log_msg.'gopls executable detected')
    let g:coc_preferences['go.goplsOptions']= {
    \ 'completeUnimported':v:true,
    \ 'deepCompletion': v:true ,
    \ 'usePlaceholders': v:false,
    \ 'staticcheck': v:false,
    \ }
  endif
endfunction
function! before#coc#lang#go#linter()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  
  if executable('golangci-lint')
    call SpaceVim#logger#info(l:base_log_msg.'golangci-lint executable detected')
    if executable('golangci-lint-langserver')
      let g:coc_languageserver['golangci-lint-languageserver']={
      \   "command": "golangci-lint-langserver",
      \   "rootPatterns": ["go.mod", ".vim/", ".git/", ".svn/"],
      \   "filetypes": ["go"],
      \   "initializationOptions": {
      \   "command": [
      \     "golangci-lint","run",
      \     "--print-issued-lines=false",
      \     "--exclude-use-default=false",
      \     "--config=${workspaceFolder}/.golangci.yml",
      \     "--out-format=json",
      \    ],
      \   },
      \ }
    endif
  endif
endfunction

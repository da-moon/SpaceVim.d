" https://github.com/unlackingc/myDevEnv/blob/master/vim/go.vim
function! before#lang#go#bootstrap()
  call SpaceVim#logger#info('[ before#lang#go#bootstrap ] function called.')
  if executable('go')
    call SpaceVim#logger#info('[ before#spacevim#golang#bootstrap ] go toolchain detected. Adding associated vim plugin and configuration')
    call add(g:spacevim_custom_plugins,['fatih/vim-go',{ 'on_ft' : 'go','build': ':GoUpdateBinaries','hook_post_update': ':GoUpdateBinaries' }])
    let g:spacevim_layers['lang#go']={}
    call add(g:coc_global_extensions,'coc-go')
    call add(g:coc_filetypes,'go')


    " [ NOTE ] these probably don't work
    let g:coc_preferences['go.testOnSave'] = v:false
    let g:coc_preferences['go.coverMode']='atomic'
    let g:coc_preferences['go.buildOnSave']='package'
    let g:coc_preferences['go.lintOnSave']='package'
    let g:coc_preferences['go.vetOnSave']='package'
    let g:coc_preferences['go.lintTool']='golangci-lint'
    let g:coc_preferences['go.toolsManagement.checkForUpdates']='proxy'
    let g:coc_preferences['go.useLanguageServer']=v:true
    let g:coc_preferences['go.autocompleteUnimportedPackages']=v:true
    let g:coc_preferences['go.gotoSymbol.includeImports']=v:true
    let g:coc_preferences['go.gotoSymbol.includeGoroot']=v:true

    let g:coc_preferences['go.testFlags']=[
      \ '-v',
      \ '-timeout',
      \ '5m',
    \]
    let g:go_doc_popup_window = 1
    let g:go_list_type = 'quickfix'
    let g:go_debug = [
      \ 'shell-commands',
    \]
    let g:go_highlight_functions = 1
    let g:go_textobj_include_function_doc = 1
    let g:go_addtags_transform = 'snakecase'
    let g:go_decls_includes = 'func,type'
    let g:go_fmt_fail_silently = 1
    let g:go_fmt_command = 'goimports'
    let g:go_auto_type_info = 1
    let g:go_auto_sameids = 1
    call before#lang#go#gopls()
    call before#lang#go#highlight()
    call before#lang#go#linter()
  end
endfunction
function! before#lang#go#highlight()
  call SpaceVim#logger#info("[ before#lang#go#highlight ] function called")
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_generate_tags = 1
endfunction
function! before#lang#go#gopls()
  call SpaceVim#logger#info("[ before#lang#go#gopls ] function called")
  if executable('gopls')
    call SpaceVim#logger#info("[ before#lang#go#gopls ] gopls executable detected")
    let g:lsp_servers['go']='gopls'
    let g:lsp_override_cmd['go']=['gopls', '-mode', 'stdio']
    let g:go_rename_command = 'gopls'
    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'
    let g:go_gopls_config={
      \ 'fillreturns': v:true
    \}
    let g:coc_preferences['go.goplsOptions']= {
    \ 'completeUnimported':v:true,
    \ 'deepCompletion': v:true ,
    \ 'usePlaceholders': v:false,
    \ 'staticcheck': v:false,
    \ }
  endif
endfunction
function! before#lang#go#linter()
  call SpaceVim#logger#info("[ before#lang#go#linter ] function called")
  if executable('golangci-lint')
    call SpaceVim#logger#info("[ before#lang#go#linter ] golangci-lint Executable detected")
    let s:golangci_config = SpaceVim#plugins#projectmanager#current_root(). '.golangci.yml'
    if (filereadable(s:golangci_config))
      let g:go_metalinter_command = "golangci-lint"
      let g:go_metalinter_autosave = 1
    endif
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

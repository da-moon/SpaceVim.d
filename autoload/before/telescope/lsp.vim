function! before#telescope#lsp#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  if has('nvim')
    let g:_spacevim_mappings.t.l = {'name' : '+Neovim LSP'}
    
    call before#telescope#lsp#symbols()
    call before#telescope#lsp#go_to()
    call before#telescope#lsp#actions()
    call before#telescope#lsp#diagnostics()

    let g:_spacevim_mappings.t.l.r = [':Telescope lsp_references',
    \ 'List LSP references for word under the cursor',
    \ [
    \ '[Leader t l r] Lists LSP references for word under the cursor',
    \ '',
    \ '',
    \ ]
    \ ]

  endif
endfunction

function! before#telescope#lsp#symbols()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.l.s = {'name' : '+Symbols'}
  let g:_spacevim_mappings.t.l.s.b = [':Telescope lsp_document_symbols',
  \ 'List LSP references for word under the cursor',
  \ [
  \ '[Leader t l s b] Lists LSP document symbols in the current buffer',
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.l.s.w = [':Telescope lsp_workspace_symbols',
  \ 'List LSP document symbols in the current workspace',
  \ [
  \ '[Leader t l s w] Lists LSP document symbols in the current workspace',
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.l.s.d = [':Telescope lsp_dynamic_workspace_symbols',
  \ 'Dynamically List LSP for all workspace symbols',
  \ [
  \ '[Leader t l s d] Dynamically Lists LSP for all workspace symbols',
  \ '',
  \ '',
  \ ]
  \ ]
endfunction

function! before#telescope#lsp#go_to()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.l.g = {'name' : '+GoTo'}
  let g:_spacevim_mappings.t.l.g.i = [':Telescope lsp_implementations',
  \ 'List and goto the implementation of the word under the cursor',
  \ [
  \ "[Leader t l g i] Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope",
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.l.g.d = [':Telescope lsp_definitions',
  \ 'List and goto the definition of the word under the cursor',
  \ [
  \ "[Leader t l g d] Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope",
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.l.g.t = [':Telescope lsp_type_definitions',
  \ 'List and goto the type definition of the word under the cursor',
  \ [
  \ "[Leader t l g t] Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope",
  \ '',
  \ '',
  \ ]
  \ ]
endfunction

function! before#telescope#lsp#actions()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.l.a = {'name' : '+Actions'}
  let g:_spacevim_mappings.t.l.a.w = [':Telescope lsp_code_actions',
  \ 'List and trigger LSP action for the word under the cursor',
  \ [
  \ "[Leader t l a w] Lists any LSP actions for the word under the cursor, that can be triggered with `<cr>`",
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.l.a.r = [':Telescope lsp_range_code_actions',
  \ 'List and trigger LSP action for a given range',
  \ [
  \ "[Leader t l a r] Lists any LSP actions for a given range, that can be triggered with `<cr>`",
  \ '',
  \ '',
  \ ]
  \ ]
endfunction

function! before#telescope#lsp#diagnostics()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.l.d = {'name' : '+Diagnostics'}
  let g:_spacevim_mappings.t.l.d.d = [':Telescope lsp_document_diagnostics',
  \ 'Lists LSP diagnostics for the current buffer',
  \ [
  \ "[Leader t l d d] Lists LSP diagnostics for the current buffer",
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.l.d.w = [':Telescope lsp_workspace_diagnostics',
  \ 'Lists LSP diagnostics for the current buffer',
  \ [
  \ "[Leader t l d w] Lists LSP diagnostics for the current workspace if supported, otherwise searches in all open buffers",
  \ '',
  \ '',
  \ ]
  \ ]
endfunction

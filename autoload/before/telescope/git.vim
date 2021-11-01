function! before#telescope#git#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.g = {'name' : '+Git'}
  let g:_spacevim_mappings.t.g.c = [':Telescope git_commits',
    \ 'Lists git commits',
    \ [
    \ '[Leader t g c] Lists git commits with diff preview, checkout action `<cr>`, reset mixed `<C-r>m`, reset soft `<C-r>s` and reset hard `<C-r>h`',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.g['C'] = [':Telescope git_bcommits',
    \ "Lists buffer's git commits",
    \ [
    \ "[Leader t g C] Lists buffer's git commits with diff preview and checks them out on `<cr>`",
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.g.b = [':Telescope git_branches',
    \ 'Lists branches',
    \ [
    \ '[Leader t g b] Lists all branches with log preview, checkout action `<cr>`, track action `<C-t>` and rebase action`<C-r>`',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.g.s = [':Telescope git_status',
    \ 'Lists current changes (git status)',
    \ [
    \ '[Leader t g s]  Lists current changes per file with diff preview and add action.',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.g['S'] = [':Telescope git_stash',
    \ 'Lists git stash items',
    \ [
    \ '[Leader t g S] Lists stash items in current repository with ability to apply them on `<cr>`',
    \ '',
    \ '',
    \ ]
    \ ]
endfunction

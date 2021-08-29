function! before#spacevim#filemanager#defx() abort
  call SpaceVim#logger#info("[ before#spacevim#filemanger#defx ] function called.")
  let g:spacevim_filemanager="defx"
  call SpaceVim#logger#info("[ before#spacevim#filemanger#defx ] default file manager was set to '".g:spacevim_filemanager."'.")
  let g:spacevim_filetree_direction="left"
  call SpaceVim#logger#info("[ before#spacevim#filemanger#defx ] filetree direction was set to to '".g:spacevim_filetree_direction."'")
  let g:spacevim_enable_vimfiler_gitstatus="true"
endfunction
" [ NOTE ] https://github.com/ms-jpq/chadtree/blob/chad/docs/KEYBIND.md
function! before#spacevim#filemanager#chadtree() abort 
  call SpaceVim#logger#info("[ before#spacevim#filemanager#chadtree ] function called.")
  let g:spacevim_filemanager=""
  let g:spacevim_filetree_direction=""
  let g:spacevim_enable_vimfiler_gitstatus=""
  call add(g:spacevim_custom_plugins,['ms-jpq/chadtree',{ 'branch' : 'chad','build':'python3 -m chadtree deps'}])
  call SpaceVim#logger#info("[ before#spacevim#filemanager#chadtree ] setting up key bindings.")
  call SpaceVim#custom#SPC('nnoremap', ['f', 't'], 'CHADopen', 'toggle-file-tree', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'T'], 'CHADopen --version-ctl', 'show-file-tree', 1)
  call SpaceVim#custom#SPCGroupName(['f','h'], '+ChadTree-help')
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','f'], 'CHADhelp features', 'chadtree-help-features', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','k'], 'CHADhelp keybind', 'chadtree-help-keybind', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','c'], 'CHADhelp config', 'chadtree-help-config', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','t'], 'CHADhelp theme', 'chadtree-help-theme', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','m'], 'CHADhelp migration', 'chadtree-help-migration', 1)
  let g:chadtree_settings = {
  \ 'theme.text_colour_set': 'nord',
  \ 'ignore.name_exact':[
  \     'thumbs.db', 
  \     'tmp'
  \   ],
  \ 'ignore.path_glob': ['^node_modules'],
  \ 'ignore.name_glob': ['.*'],
  \ }
  autocmd bufenter * if (winnr("$") == 1 && &buftype == "nofile" && &filetype == "CHADTree") | q! | endif
  " call SpaceVim#custom#SPC('nnoremap', ['b', 't'], 'CHADopen %', 'show-file-tree-at-buffer-dir', 1)
endfunction

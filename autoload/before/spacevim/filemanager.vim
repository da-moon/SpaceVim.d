function! before#spacevim#filemanager#defx() abort
  call SpaceVim#logger#info("[ before#spacevim#filemanger#defx ] function called.")
  let g:spacevim_filemanager="defx"
  call SpaceVim#logger#info("[ before#spacevim#filemanger#defx ] default file manager was set to '".g:spacevim_filemanager."'.")
  let g:spacevim_filetree_direction="left"
  call SpaceVim#logger#info("[ before#spacevim#filemanger#defx ] filetree direction was set to to '".g:spacevim_filetree_direction."'")
  let g:spacevim_enable_vimfiler_gitstatus="true"
  fun! DefxDrawerToggle()
    if bufwinnr('defx') > 0
      execute "bd! " . bufnr('defx')
    else
      rightbelow vert split
      Defx `expand('%:p:h')`
      vert resize 60
    endif
  endfun
endfunction
function! before#spacevim#filemanager#coc_explorer() abort 
  call SpaceVim#logger#info("[ before#spacevim#filemanager#coc_explorer ] function called.")
  let g:spacevim_filemanager=""
  let g:spacevim_filetree_direction=""
  let g:spacevim_enable_vimfiler_gitstatus=""
  call add(g:coc_global_extensions,'coc-explorer')
  call SpaceVim#logger#info("[ before#spacevim#filemanager#coc_explorer ] setting up key bindings.")
  call SpaceVim#custom#SPC('nnoremap', ['f', 't'], 'CocCommand explorer --sources=buffer+,file+ --root-strategies workspace', 'toggle-file-and-buffer-tree', 1)
  call SpaceVim#custom#SPC('nnoremap', ['b', 't'], 'CocCommand explorer --sources=buffer+,file+ --root-strategies sourceBuffer', 'show-file-tree-at-buffer-dir', 1)
  augroup CocExplorer
    autocmd!
    " open explorer on start
    au VimEnter * :if bufname()=='' | call execute('CocCommand explorer') | endif
    " automatically close vim if coc-explorer is the last open buffer
    autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
  augroup END
endfunction

" [ NOTE ] https://github.com/ms-jpq/chadtree/blob/chad/docs/KEYBIND.md
function! before#spacevim#filemanager#chadtree() abort 
    call SpaceVim#logger#info("[ before#spacevim#filemanager#chadtree ] function called.")
  let g:spacevim_filemanager=""
  let g:spacevim_filetree_direction=""
  let g:spacevim_enable_vimfiler_gitstatus=""
  call add(g:spacevim_custom_plugins,['ms-jpq/chadtree',{'build': 'python3 -m chadtree deps --nvim','hook_post_update': ':UpdateRemotePlugins'}])
  call SpaceVim#logger#info("[ before#spacevim#filemanager#chadtree ] setting up key bindings.")
  call SpaceVim#custom#SPC('nnoremap', ['f', 't'], 'call CHADtreeToggle()', 'toggle-file-tree', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'y'], 'CHADopen', 'toggle-file-tree', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'T'], 'CHADopen --version-ctl', 'show-file-tree', 1)
  " call SpaceVim#custom#SPC('nnoremap', ['b', 't'], 'CHADopen '.expand('%:p:h'), 'show-file-tree-at-buffer-dir', 1)

  call SpaceVim#custom#SPCGroupName(['f','h'], '+ChadTree-help')
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','f'], 'CHADhelp features', 'chadtree-help-features', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','k'], 'CHADhelp keybind', 'chadtree-help-keybind', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','c'], 'CHADhelp config', 'chadtree-help-config', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','t'], 'CHADhelp theme', 'chadtree-help-theme', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','m'], 'CHADhelp migration', 'chadtree-help-migration', 1)
  let g:chadtree_view_width = 40
  let g:chadtree_settings = {
  \ 'view.width': g:chadtree_view_width,
  \ 'theme.text_colour_set': 'nord',
  \ 'ignore.name_exact':[
  \     'thumbs.db', 
  \     'tmp'
  \   ],
  \ 'ignore.path_glob': ['^node_modules'],
  \ 'ignore.name_glob': ['.*'],
  \ }

  
  " [ NOTE  ] https://github.com/sindrets/dotfiles/blob/master/.config/nvim/init.bak.vim
  function! CHADtreeFocus()
    if ! (exists("g:chadtree_winid") && win_id2win(g:chadtree_winid) > 0)
      let l:cur_winid = win_getid()
      execute 'CHADopen'
      if exists("l:cur_winid") && win_id2win(l:cur_winid) > 0
        while win_getid() == l:cur_winid
          sleep 1m
        endwhile
      endif
      let g:chadtree_winid = win_getid()
    endif
    if exists("g:chadtree_winid") && win_id2win(g:chadtree_winid) > 0
      call win_gotoid(g:chadtree_winid)
    endif
    augroup chadtree_focus
      au!
      au WinClosed <buffer> redraw 
      \ | if exists("g:chadtree_winid") && win_id2win(g:chadtree_winid) > 0 
      \ | unlet g:chadtree_winid 
      \ | endif
      \ | if exists("g:chadtree_config_set")
      \ | unlet g:chadtree_config_set 
      \ | endif
    augroup END
  endfunction

  function! CHADtreeToggle()
      if exists("g:chadtree_winid") && win_id2win(g:chadtree_winid) > 0
          call win_gotoid(g:chadtree_winid)
          wincmd q
      else
          call CHADtreeFocus()
      endif
  endfunction
  autocmd bufenter * if (winnr("$") == 1 && &buftype == "nofile" && &filetype == "CHADTree") | q! | endif
  augroup Chadtree
    autocmd!
    au VimEnter * :if bufname()==''
    \ | call execute('call CHADtreeToggle()')
    \ | endif
    autocmd BufEnter *
    \ if !(exists("g:chadtree_config_set") ) && ( exists("g:chadtree_winid") && win_id2win(g:chadtree_winid) > 0 && win_getid() != g:chadtree_winid)
    \ | if ! ( (bufname()=='' &&  &buftype == '' && &filetype == '') || (bufname()=='' &&  &buftype == 'nofile' && &filetype == '') || (&filetype == "CHADTree") )
    \ | let cur_winid = win_getid()
    \ | endif
    \ | if ( exists("cur_winid") && win_id2win(cur_winid) > 0)
    \ | call win_gotoid(g:chadtree_winid)
    \ | wincmd H
    \ | execute 'vertical resize ' . g:chadtree_view_width
    \ | call win_gotoid(cur_winid)
    \ | let g:chadtree_config_set = v:true
    \ | endif
    \ | endif
  augroup END
endfunction


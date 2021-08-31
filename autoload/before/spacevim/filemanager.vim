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
" [ NOTE ] https://github.com/ms-jpq/chadtree/blob/chad/docs/KEYBIND.md
function! before#spacevim#filemanager#chadtree() abort 
  call SpaceVim#logger#info("[ before#spacevim#filemanager#chadtree ] function called.")
  let g:spacevim_filemanager=""
  let g:spacevim_filetree_direction=""
  let g:spacevim_enable_vimfiler_gitstatus=""
  call add(g:spacevim_custom_plugins,['ms-jpq/chadtree',{ 'branch' : 'chad','build':'python3 -m chadtree deps'}])
  call SpaceVim#logger#info("[ before#spacevim#filemanager#chadtree ] setting up key bindings.")
  call SpaceVim#custom#SPC('nnoremap', ['f', 't'], 'call CHADtreeToggle()', 'toggle-file-tree', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'y'], 'CHADopen', 'toggle-file-tree', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'T'], 'CHADopen --version-ctl', 'show-file-tree', 1)
  call SpaceVim#custom#SPCGroupName(['f','h'], '+ChadTree-help')
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','f'], 'CHADhelp features', 'chadtree-help-features', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','k'], 'CHADhelp keybind', 'chadtree-help-keybind', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','c'], 'CHADhelp config', 'chadtree-help-config', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','t'], 'CHADhelp theme', 'chadtree-help-theme', 1)
  call SpaceVim#custom#SPC('nnoremap', ['f', 'h','m'], 'CHADhelp migration', 'chadtree-help-migration', 1)
  let g:chadtree_settings = {
  \ 'view.width':40,
  \ 'theme.text_colour_set': 'nord',
  \ 'ignore.name_exact':[
  \     'thumbs.db', 
  \     'tmp'
  \   ],
  \ 'ignore.path_glob': ['^node_modules'],
  \ 'ignore.name_glob': ['.*'],
  \ }

  " autocmd Filetype CHADTree vertical resize 80
  autocmd bufenter * if (winnr("$") == 1 && &buftype == "nofile" && &filetype == "CHADTree") | q! | endif
  augroup Chadtree
    autocmd!
    autocmd BufEnter *
              \ if ( exists("g:chadtree_winid") && win_id2win(g:chadtree_winid) > 0)
              \ | let cur_winid = win_getid()
              \ | call win_gotoid(g:chadtree_winid)
              \ | wincmd H
              \ | call win_gotoid(cur_winid)
              \ | endif
    autocmd BufEnter *
              \ if ( exists("g:chadtree_winid") && win_id2win(g:chadtree_winid) > 0)
              \ | let cur_winid = win_getid()
              \ | call win_gotoid(g:chadtree_winid)
              \ | vertical resize 40
              \ | call win_gotoid(cur_winid)
              \ | endif

  augroup END

    " autocmd TermOpen * if &buftype == 'terminal' | setl nonumber | startinsert| endif
    " command! -nargs=0 Terminal vertical botright new | startinsert | terminal

  " [ NOTE  ] https://github.com/sindrets/dotfiles/blob/master/.config/nvim/init.bak.vim
  function! CHADtreeFocus()
      if exists("g:chadtree_winid") && win_id2win(g:chadtree_winid) > 0
          call win_gotoid(g:chadtree_winid)
      else
          let cur_winid = win_getid()
          CHADopen
          while win_getid() == cur_winid
              sleep 1m
          endwhile
          let g:chadtree_winid = win_getid()
          augroup chadtree_focus
              au!
              au WinClosed <buffer> unlet g:chadtree_winid
          augroup END
      endif
      call win_gotoid(g:chadtree_winid)
  endfunction

  function! CHADtreeToggle()
      if exists("g:chadtree_winid") && win_id2win(g:chadtree_winid) > 0
          call win_gotoid(g:chadtree_winid)
          wincmd q
      else
          call CHADtreeFocus()
      endif
  endfunction

  " call SpaceVim#custom#SPC('nnoremap', ['b', 't'], 'CHADopen '.expand('%:p:h'), 'show-file-tree-at-buffer-dir', 1)
endfunction


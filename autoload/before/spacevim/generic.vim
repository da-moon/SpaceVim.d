
function! before#spacevim#generic#variables()
  call SpaceVim#logger#info("[ before#spacevim#generic#variables ] function called.")
  let g:spacevim_enable_debug = 1
  let g:spacevim_realtime_leader_guide = 1
  let g:spacevim_enable_tabline_filetype_icon = 1
  let g:spacevim_enable_statusline_display_mode = 0
  let g:spacevim_enable_os_fileformat_icon = 1
  let g:spacevim_buffer_index_type = 1
  let g:spacevim_todo_labels = [
    \'FIXME',
    \'[FIXME]',
    \'[ FIXME ]',
    \'QUESTION',
    \'[QUESTION]',
    \'[ QUESTION ]',
    \'TODO',
    \'[TODO]',
    \'[ TODO ]',
    \'IDEA',
    \'[IDEA]',
    \'[ IDEA ]',
  \]
endfunction
function! before#spacevim#generic#tabsizes() abort
  call SpaceVim#logger#info("[ before#spacevim#generic#tabsizes ] function called.")
  let spacevim_default_indent = 2
  let spacevim_shiftwidth=2
  call SpaceVim#logger#info("[ before#spacevim#generic#tabsizes ] setting .go file tab sizes")
  au BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4
  call SpaceVim#logger#info("[ before#spacevim#generic#tabsizes ] setting .vim file tab sizes")
  au BufNewFile,BufRead *.vim setlocal expandtab tabstop=4 shiftwidth=2
  call SpaceVim#logger#info("[ before#spacevim#generic#tabsizes ] setting yaml file tab sizes")
  au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab tabstop=4 shiftwidth=2
endfunction
function! before#spacevim#generic#filemanager() abort
  call SpaceVim#logger#info("[ before#spacevim#generic#filemanager ] function called.")
  let g:spacevim_filemanager="defx"
  call SpaceVim#logger#info("[ before#spacevim#generic#filemanager ] default file manager was set to '".g:spacevim_filemanager."'.")
  let g:spacevim_filetree_direction="left"
  call SpaceVim#logger#info("[ before#spacevim#generic#filemanager ] filetree direction was set to to '".g:spacevim_filetree_direction."'")
  let g:spacevim_enable_vimfiler_gitstatus="true"
endfunction
function! before#spacevim#generic#column() abort
  call SpaceVim#logger#info("[ before#spacevim#generic#column ] function called.")
  let spacevim_max_column = 80
  let spacevim_colorcolumn = 120
  set colorcolumn=80,125
endfunction
function! before#spacevim#generic#bootstrap()
  call SpaceVim#logger#info("[ before#spacevim#generic#bootstrap ] function called.")
  call before#spacevim#generic#variables()
  call before#spacevim#generic#filemanager()
  call before#spacevim#generic#column()
   if &term =~ 'screen'
    set term=xterm-256color
  endif
  call SpaceVim#logger#info("[ before#spacevim#generic#bootstrap ] Default to case insensitive searches.")
  set ignorecase
  set smartcase
  call SpaceVim#logger#info("[ before#spacevim#generic#bootstrap ] Keep lines above or below the cursor at all times.")
  set scrolloff=7
  call SpaceVim#logger#info("[ before#spacevim#generic#bootstrap ] Wrap around lines in insert mode.")
  set whichwrap+=<,>,h,l,[,]
  call SpaceVim#logger#info("[ before#spacevim#generic#bootstrap ] Raise cmdheight so echodoc can display function parameters.")
  set cmdheight=2
  call SpaceVim#logger#info("[ before#spacevim#generic#bootstrap ] Decrease idle time.")
  set updatetime=350
  if executable('fd')
    let g:spacevim_filesearching_tools = ['fd', 'fd -H']
  end
  let g:spacevim_sidebar_direction = 'left'
  let g:spacevim_guifont = "Sauce Code Pro Nerd Font Complete Mono:h22"
  let g:spacevim_automatic_update = "true"
  let g:spacevim_rehash256 = 1
  let g:spacevim_autowite = 1
  let g:spacevim_autocomplete_method = 'coc'
  let g:spacevim_updatetime=100
  let g:spacevim_rainbow_active = 1
endfunction

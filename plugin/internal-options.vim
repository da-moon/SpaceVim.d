"
" ──── INTERNAL OPTIONS ──────────────────────────────────────────────
"
if &term =~ 'screen'
  set term=xterm-256color
endif
set encoding=UTF-8
call SpaceVim#logger#info('Keep lines above or below the cursor at all times.')
set scrolloff=7
call SpaceVim#logger#info('Wrap around lines in insert mode.')
set whichwrap+=<,>,h,l,[,]
call SpaceVim#logger#info('Raise cmdheight so echodoc can display function parameters.')
set cmdheight=2
call SpaceVim#logger#info('Decrease idle time.')
set updatetime=350
" ─────────────────────────────────────────────────────────────────────
set colorcolumn=80,125
"
" ──── SEARCHING ──────────────────────────────────────────────────────
"
call SpaceVim#logger#info('Default to case insensitive searches.')
set ignorecase
set smartcase

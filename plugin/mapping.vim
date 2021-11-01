" ─────────────────────────────────────────────────────────────────────
  call SpaceVim#logger#info('enabling forward search in visual block mode with "*"')
  vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
  call SpaceVim#logger#info('enabling backward search in visual block mode with "#"')
  vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
  call SpaceVim#logger#info('enabling easy search and replace in visual mode with ctrl+r')
  vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" ─────────────────────────────────────────────────────────────────────
  call SpaceVim#logger#info('mapping shift+up key to visually highlight text upwards')
  nmap <S-Up> v<Up>
  vmap <S-Up> <Up>
  imap <S-Up> <Esc>v<Up>
  call SpaceVim#logger#info('mapping shift + down key to visually highlight text downwards')
  nmap <S-Down> v<Down>
  vmap <S-Down> <Down>
  imap <S-Down> <Esc>v<Down>
  call SpaceVim#logger#info('mapping shift + left key to visually highlight text left hand side')
  nmap <S-Left> v<Left>
  vmap <S-Left> <Left>
  imap <S-Left> <Esc>v<Left>
  call SpaceVim#logger#info('mapping shift + right key to visually highlight text on right hand side')
  nmap <S-Right> v<Right>
  vmap <S-Right> <Right>
  imap <S-Right> <Esc>v<Right>
  call SpaceVim#logger#info('mapping shift + right key to visually highlight text on right hand side')
  nmap <S-Right> v<Right>
  vmap <S-Right> <Right>
  imap <S-Right> <Esc>v<Right>
" ─────────────────────────────────────────────────────────────────────
  call SpaceVim#logger#info('mapping ctrl+c to copy selected text.')
  vmap <C-c> y<Esc>i
  call SpaceVim#logger#info('mapping ctrl+x to paste selected text.')
  vmap <C-x> d<Esc>i
  call SpaceVim#logger#info('mapping ctrl+v to paste text.')
  map <C-v> pi
  imap <C-v> <Esc>pi
  call SpaceVim#logger#info('mapping alt+v to start Visual Block mode.')
  nnoremap <M-v> <C-v>
" ─────────────────────────────────────────────────────────────────────
  " " [ NOTE ] => https://unix.stackexchange.com/a/137924
  " call SpaceVim#logger#info('mapping ctrl+z to undo operation.')
  " imap <C-z> <Esc>ui
  " call SpaceVim#logger#info('mapping ctrl+shift+z to redo operation.')
  " imap <C-S-z> <Esc>ri
" ─────────────────────────────────────────────────────────────────────
" https://vim.fandom.com/wiki/Quickly_adding_and_deleting_empty_lines
call SpaceVim#logger#info('mapping ctrl + j key to delete blank line below')
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
call SpaceVim#logger#info('mapping ctrl + k key to delete blank line above')
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
call SpaceVim#logger#info('mapping alt + j key to insert blank line below')
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
call SpaceVim#logger#info('mapping alt + k key to insert blank line above')
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>


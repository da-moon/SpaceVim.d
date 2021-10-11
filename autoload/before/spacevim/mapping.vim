function! before#spacevim#mapping#bootstrap() abort
  call SpaceVim#logger#info("[ before#spacevim#mapping#bootstrap ] function called.")
  call SpaceVim#logger#info("[ before#spacevim#mapping#bootstrap ] binding coc-nvim group to 'C'.")
  call SpaceVim#custom#SPCGroupName(['C'], '+Coc-nvim')
  call before#spacevim#mapping#search()
  call before#spacevim#mapping#align()
  call before#spacevim#mapping#idiomatic_bindings()
endfunction
function! before#spacevim#mapping#search() abort
  call SpaceVim#logger#info("[ before#spacevim#mapping#search ] function called.")
  call SpaceVim#logger#info("[ before#spacevim#mapping#bootstrap ] enabling forward search in visual block mode with '*'")
  vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
  call SpaceVim#logger#info("[ before#spacevim#mapping#bootstrap ] enabling backward search in visual block mode with '#'")
  vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
  call SpaceVim#logger#info("[ before#spacevim#mapping#bootstrap ] enabling easy search and replace in visual mode with ctrl+r")
  vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
endfunction
" [ NOTE ] => 
" - https://github.com/junegunn/vim-easy-align#examples-using-predefined-rules
function! before#spacevim#mapping#align() abort
  " call SpaceVim#custom#SPCGroupName(['A'], '+Vim-easy-align')
  " call SpaceVim#custom#SPC('xmap', ['A', 'v'], 'EasyAlign', 'start-interactive-easy-align-in-visual-mode',1)
  " call SpaceVim#custom#SPC('nmap', ['A', 'a'], 'EasyAlign', 'start-interactive-easy-align-for-a-motion-or-text-object',1)
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
endfunction
function! before#spacevim#mapping#idiomatic_bindings() abort
  call SpaceVim#logger#info("[ before#spacevim#mapping#idiomatic_bindings ] function called.")
  call before#spacevim#mapping#shift_arrow()
  call before#spacevim#mapping#clipboard()
  " [ NOTE ] => https://unix.stackexchange.com/a/137924
  call SpaceVim#logger#info("[ before#spacevim#mapping#idiomatic_bindings ] mapping ctrl+z to undo operation.")
  imap <C-z> <Esc>ui
  call SpaceVim#logger#info("[ before#spacevim#mapping#idiomatic_bindings ] mapping ctrl+shift+z to redo operation.")
  imap <C-S-z> <Esc>ri
endfunction

" [ NOTE ] => https://stackoverflow.com/a/25167579
function! before#spacevim#mapping#shift_arrow() abort
  call SpaceVim#logger#info("[ before#spacevim#mapping#shift_arrow ] function called.")
  call SpaceVim#logger#info("[ before#spacevim#mapping#shift_arrow ] mapping shift+up key to visually highlight text upwards")
  nmap <S-Up> v<Up>
  vmap <S-Up> <Up>
  imap <S-Up> <Esc>v<Up>
  call SpaceVim#logger#info("[ before#spacevim#mapping#shift_arrow ] mapping shift + down key to visually highlight text downwards")
  nmap <S-Down> v<Down>
  vmap <S-Down> <Down>
  imap <S-Down> <Esc>v<Down>
  call SpaceVim#logger#info("[ before#spacevim#mapping#shift_arrow ] mapping shift + left key to visually highlight text left hand side")
  nmap <S-Left> v<Left>
  vmap <S-Left> <Left>
  imap <S-Left> <Esc>v<Left>
  call SpaceVim#logger#info("[ before#spacevim#mapping#shift_arrow ] mapping shift + right key to visually highlight text on right hand side")
  nmap <S-Right> v<Right>
  vmap <S-Right> <Right>
  imap <S-Right> <Esc>v<Right>
  call SpaceVim#logger#info("[ before#spacevim#mapping#shift_arrow ] mapping shift + right key to visually highlight text on right hand side")
  nmap <S-Right> v<Right>
  vmap <S-Right> <Right>
  imap <S-Right> <Esc>v<Right>
endfunction

function! before#spacevim#mapping#clipboard() abort
  call SpaceVim#logger#info("[ before#spacevim#mapping#clipboard ] function called.")
  call SpaceVim#logger#info("[ before#spacevim#mapping#clipboard ] mapping ctrl+c to copy selected text.")
  vmap <C-c> y<Esc>i
  call SpaceVim#logger#info("[ before#spacevim#mapping#clipboard ] mapping ctrl+x to cut selected text.")
  vmap <C-x> d<Esc>i
  call SpaceVim#logger#info("[ before#spacevim#mapping#clipboard ] mapping ctrl+v to paste text.")
  " 'alt+v' switches to visal block
  nnoremap <M-v> <C-v>
  
  map <C-v> pi
  imap <C-v> <Esc>pi
endfunction



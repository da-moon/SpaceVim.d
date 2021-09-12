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
function! before#spacevim#mapping#bootstrap() abort
  call SpaceVim#logger#info("[ before#spacevim#mapping#bootstrap ] function called.")
  call SpaceVim#logger#info("[ before#spacevim#mapping#bootstrap ] binding coc-nvim group to 'C'.")
  call SpaceVim#custom#SPCGroupName(['C'], '+Coc-nvim')
  call before#spacevim#mapping#search()
  call before#spacevim#mapping#align()
endfunction
" [ NOTE ] => https://github.com/junegunn/vim-easy-align
function! before#spacevim#mapping#align() abort
  call SpaceVim#custom#SPCGroupName(['A'], '+Vim-easy-align')
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
  " call SpaceVim#custom#SPC('xmap', ['A', 'a'], '<plug>(EasyAlign)', 'start-interactive-easy-align-in-visual-mode',1)
  " call SpaceVim#custom#SPC('nmap', ['A', 'a'], '<plug>(EasyAlign)', 'start-interactive-easy-align-for-a-motion-or-text-object',1)
  " xmap ga <Plug>(EasyAlign)
  " nmap ga <Plug>(EasyAlign)
endfunction

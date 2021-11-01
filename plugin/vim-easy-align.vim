" [ NOTE ] => 
" - https://github.com/junegunn/vim-easy-align#examples-using-predefined-rules
" ─────────────────────────────────────────────────────────────────────
" call SpaceVim#custom#SPCGroupName(['A'], '+Vim-easy-align')
" call SpaceVim#custom#SPC('xmap', ['A', 'v'], 'EasyAlign', 'start-interactive-easy-align-in-visual-mode',1)
" call SpaceVim#custom#SPC('nmap', ['A', 'a'], 'EasyAlign', 'start-interactive-easy-align-for-a-motion-or-text-object',1)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

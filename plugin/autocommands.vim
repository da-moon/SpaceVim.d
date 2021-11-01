autocmd VimEnter * call dein#call_hook('post_source')
"
" ──── FILE TAB SIZES ────────────────────────────────────────────────
"
call SpaceVim#logger#info('setting rust file tab sizes')
au BufNewFile,BufRead *.rs setlocal expandtab tabstop=4 shiftwidth=4
call SpaceVim#logger#info('setting go file tab sizes')
au BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4
call SpaceVim#logger#info('setting vim file tab sizes')
au BufNewFile,BufRead *.vim setlocal expandtab tabstop=2 shiftwidth=2
call SpaceVim#logger#info('setting yaml file tab sizes')
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab tabstop=2 shiftwidth=2
"
" ──── PACKER ────────────────────────────────────────────────────────
"
if exists(':PackerCompile')
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
endif

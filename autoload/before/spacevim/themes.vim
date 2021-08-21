let s:themes= [
  \ "monokai_pro",
  \ "gruvbox",
  \ "sonokai",
  \ "dracula",
\]
let s:plugins = [
  \ 'sainnhe/sonokai',
  \ 'dracula/vim',
  \ 'phanviet/vim-monokai-pro',
\]
function! before#spacevim#themes#bootstrap()
  call SpaceVim#logger#info("[ before#spacevim#themes#bootstrap ] function called.")
  for plugin in s:plugins
    call SpaceVim#logger#info("[ before#spacevim#themes#bootstrap ] adding '" . plugin . "' plugin")
    " call add(g:spacevim_custom_plugins,[plugin,{ 'merged': '0' }])
  endfor
  let l:remainder = localtime() % len(s:themes)
  let l:selected=s:themes[l:remainder]
  call SpaceVim#logger#info("[ config ] selected '".l:selected."' theme randomly.")
  let g:spacevim_colorscheme=l:selected
  " call before#spacevim#themes#github()
endfunction
function! before#spacevim#themes#github()
  call SpaceVim#logger#info("[ before#spacevim#themes#github ] function called.")
  call SpaceVim#logger#info("[ before#spacevim#themes#github ] adding plugin.")
  call add(g:spacevim_custom_plugins,['cormacrelf/vim-colors-github'])
  let g:spacevim_colorscheme="github"
  let g:airline_theme = "github"
  let g:lightline = { 'colorscheme': 'github' }
  let g:spacevim_colorscheme_bg="light"
endfunction

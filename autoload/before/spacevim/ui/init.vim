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

function! before#spacevim#ui#init#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')

  for plugin in s:plugins
    call SpaceVim#logger#info(l:base_log_msg."adding '" . plugin . "' plugin")
    call add(g:spacevim_custom_plugins,[plugin,{ 'merged': '0' }])
  endfor
  let l:remainder = localtime() % len(s:themes)
  let l:selected=s:themes[l:remainder]
  call SpaceVim#logger#info(l:base_log_msg."selected '".l:selected."' theme randomly.")
  let g:spacevim_colorscheme=l:selected
  " call before#layers#spacevim#ui#init#github()

endfunction

function! before#spacevim#ui#init#github()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  call add(g:spacevim_custom_plugins,['cormacrelf/vim-colors-github'])
  let g:spacevim_colorscheme="github"
  let g:airline_theme = "github"
  let g:lightline = { 'colorscheme': 'github' }
  let g:spacevim_colorscheme_bg="light"
endfunction

" ─────────────────────────────────────────────────────────────────────
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
" ─────────────────────────────────────────────────────────────────────
if executable('fd')
  let g:spacevim_filesearching_tools = ['fd', 'fd -H']
end
" ─────────────────────────────────────────────────────────────────────
let g:spacevim_sidebar_direction = 'left'
let g:spacevim_guifont = "Sauce Code Pro Nerd Font Complete Mono:h22"
let g:spacevim_automatic_update = "true"
let g:spacevim_rehash256 = 1
let g:spacevim_autowite = 1
let g:spacevim_autocomplete_method = 'coc'
let g:spacevim_updatetime=100
let g:spacevim_rainbow_active = 1
"
" ──── TABSIZES ──────────────────────────────────────────────────────
"
let g:spacevim_default_indent = 2
let g:spacevim_shiftwidth=2
"
" ──── COLUMNS ────────────────────────────────────────────────────────
"
let g:spacevim_max_column = 80
let g:spacevim_colorcolumn = 120

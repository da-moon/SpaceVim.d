" https://github.com/plasticboy/vim-markdown#adjust-new-list-item-indent
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
autocmd FileType markdown
  \ | setlocal indentexpr=0

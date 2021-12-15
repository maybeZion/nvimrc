syntax enable
set termguicolors
set background=dark
colorscheme solarized
highlight Comment cterm=italic gui=italic

" mode aware cursors
set gcr+=o:Cursor
set gcr+=n:Cursor
hi! InsertCursor  ctermfg=0 guifg=#073642 ctermbg=3 guibg=#b58900
set gcr+=i-ci-sm:InsertCursor
hi! ReplaceCursor ctermfg=0 guifg=#073642 ctermbg=1 guibg=#dc322f
set gcr+=r-cr:ReplaceCursor
hi! CommandCursor ctermfg=0 guifg=#073642 ctermbg=7 guibg=#2aa198
set gcr+=c:CommandCursor
hi! VisualCursor  ctermfg=0 guifg=#073642 ctermbg=5 guibg=#d33682
set gcr+=v-ve:VisualCursor

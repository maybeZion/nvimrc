set history=500
set wildmenu
set autochdir
set noswapfile
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set nowrap
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set noshowmode
set tm=500
set encoding=UTF-8
set hidden
set autoindent
set nostartofline
set confirm
set mouse=a
set cmdheight=2
set nocompatible
set notimeout ttimeout ttimeoutlen=200
set splitbelow
set splitright
set shiftwidth=2
set softtabstop=2
set showtabline=0
set expandtab
set laststatus=2
set nobackup
set nowritebackup
set showcmd
set shortmess+=c
set viewoptions+=unix,slash
set guicursor=
set list
set listchars=tab:▷▷⋮ 
set completeopt=menuone,noinsert,noselect
set updatetime=100
filetype indent plugin on
syntax on
set autoread
au FocusGained,BufEnter * checktime
set so=7
try
  set undodir=~/.vim_undodir
  set undofile
catch
endtry

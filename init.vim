set history=500

filetype indent plugin on
syntax on
set autoread

au FocusGained,BufEnter * checktime
set so=7

set wildmenu
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
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
set tm=500
set encoding=UTF-8
set hidden
set autoindent
set nostartofline
set confirm
set mouse=a
set cmdheight=2
set number
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
set signcolumn=number
set showcmd
set noshowmode
set shortmess+=c
set colorcolumn=80
set guicursor=

call plug#begin('~/.vim/plugged')
  Plug 'sp5/nvim-colors-solarized'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf.vim'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'Yggdroot/indentLine'
  Plug 'lambdalisue/suda.vim'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

syntax enable
set termguicolors
set background=dark
colorscheme solarized

map Y y$

let s:linting = 1

function! LintToggle()
    if s:linting
	execute 'CocDisable'
	let s:linting = 0
    else
	execute 'CocEnable'
	let s:linting = 1
    endif
    execute 'ALEToggle'
endfunction

let s:spell = 0

function! SpellToggle()
  if s:spell
    execute 'set nospell'
    let s:spell = 0
  else
    execute 'set spell'
    let s:spell = 1
  endif
endfunction

let s:paste = 0

function! PasteToggle()
  if s:paste
    execute 'set nopaste'
    execute 'set number'
    let s:paste = 0
  else
    execute 'set paste'
    execute 'set nonumber'
    let s:paste = 1
  endif
  execute 'IndentLinesToggle'
endfunction

let mapleader = " "
nnoremap <silent> <Leader>t :tabnew<CR>
nnoremap <silent> <tab> :tabn<CR>
nnoremap <silent> <s-tab> :tabp<CR>
nnoremap <silent> <F11> :call PasteToggle() <CR>
nnoremap ; :FZF <CR>
nnoremap <silent> <C-s> :call SpellToggle() <CR>
nnoremap <C-l> :call LintToggle() <CR>
nnoremap <C-o> :NERDTreeToggle <CR>
command! W :SudaWrite

let g:javascript_plugin_flow = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_c_parse_makefile = 1
let g:gitgutter_set_sign_backgrounds = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#ale#show_line_numbers = 0
let g:airline_extensions = ['ale']
let g:airline_section_y = ''
let g:airline_section_x = ''
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline#extensions#whitespace#enabled = 0

let g:fzf_layout = { 'down': '10%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

highlight! link SignColumn LineNr
highlight ColorColumn ctermbg=0
highlight Comment cterm=italic gui=italic

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

try
    set undodir=~/.nvim_undodir
    set undofile
catch
endtry

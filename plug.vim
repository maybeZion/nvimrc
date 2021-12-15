call plug#begin('~/.vim/plugged')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'sp5/nvim-colors-solarized'
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'
  Plug 'lambdalisue/suda.vim'
call plug#end()

" coq_nvim
let g:coq_settings = {
 \ 'display.icons.mode': 'none',
 \ 'auto_start': 'shut-up',
 \ 'display.pum.fast_close': v:false,
 \ }

" Write with perms
command! W :SudaWrite

let g:lspstate = 1

function! LspToggle()
  if g:lspstate == 1
    exe 'LspStop'
    let g:lspstate = 0
  else
    exe 'LspStart'
    let g:lspstate = 1
  endif
endfunction

" CHADTree
let g:chadtree_settings = { 'theme.text_colour_set': 'solarized_dark' }

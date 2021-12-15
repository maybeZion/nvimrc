" Leader key
let mapleader = " "

" Plugin keybinds
nnoremap <silent>; :FZF <CR>
nnoremap <silent>, :Buffers<CR>
nnoremap <silent><C-o> :CHADopen <CR>
nnoremap <silent><C-l> :call LspToggle()<CR>

" Readline keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" More <C-w> binds
nnoremap <silent><C-w>t :tabnew<CR>
nnoremap <silent><C-w>w :tabclose<CR>
nnoremap <silent><tab> gt
nnoremap <silent><S-tab> gT

" ^C and ^X to copy to system clipboard
vnoremap <silent><C-c> "+y
vnoremap <silent><C-x> "+d

let g:currentmode={
       \ 'n'      : ' NOR ',
       \ 'v'      : ' VIS ',
       \ 'V'      : ' V·L ',
       \ "\<C-V>" : ' V·B ',
       \ 'i'      : ' INS ',
       \ 'R'      : ' REP ',
       \ 'Rv'     : ' V·R ',
       \ 'c'      : ' CMD ',
       \ 't'      : ' TTY ',
       \}

function! ChangeStatusLineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=7 guibg=#eee8d5 ctermbg=0 guifg=#839496'
  elseif (mode() =~# '\v(v|V)' ||
\ g:currentmode[mode()] ==# ' V·B ' || 
\ get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=5 guibg=#eee8d5 ctermbg=0 guifg=#d33682'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=3 guibg=#eee8d5 ctermbg=0 guifg=#b58900'
  elseif (mode() ==# 'R')
    exe 'hi! StatusLine ctermfg=1 guibg=#eee8d5 ctermbg=0 guifg=#dc322f'
  elseif (mode() ==# 'c' || mode() ==# 't') 
    exe 'hi! StatusLine ctermfg=1 guibg=#eee8d5 ctermbg=0 guifg=#2aa198'
  endif
  return ''
endfunction

function TabNumbers()
  let s = ''
  for i in range(tabpagenr('$'))
  " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#StatusLine#'
    else
      let s .= '%#PmenuSel#'
    endif
    let s .= ' '.(i+1).' '
  endfor
  return s
endfunction

function! GitStatus()
  let diff = sy#repo#get_stats()
  let gitsyms = ['+', '~', '-', '']
  let branch = fugitive#head()
  let output = ''
  if branch != ''
    let output .= '  '.gitsyms[3].' '.branch.' '
    for i in range(len(diff))
      if diff[i] > 0
        let output .= gitsyms[i]
        let output .= diff[i].' '
      endif
    endfor
  endif
  return output
endfunction

function! InactiveDecor()
  " disable decorations for inactive buffer
  setlocal statusline&
  setlocal nocursorline
  setlocal colorcolumn=0
  setlocal nonumber
  setlocal norelativenumber
  setlocal signcolumn=no
endfunction

function! StatusLineInit()
  " enabling these for active buffer
  setlocal cursorline
  setlocal colorcolumn=80
  setlocal number
  setlocal relativenumber
  setlocal signcolumn=number
  " modal status colors
  setlocal statusline=%{ChangeStatusLineColor()}
  " display column number in bottom left
  setlocal statusline+=%#CursorLineNr#
  " icky one liner to make column number align with line numbers
  setlocal statusline+=%{%col('.')/100>=1?'%v\ ':'\ %2v\ '%}
  " set modal status color
  setlocal statusline+=%#StatusLine#
  " show mode in statusline
  setlocal statusline+=%{toupper(g:currentmode[mode()])}
  setlocal statusline+=%{GitStatus()}
  " show 
  setlocal statusline+=%#LineNr#\ %f\ %m%r%h%w
  setlocal statusline+=%=
  setlocal statusline+=\ %P
  setlocal statusline+=\ %#StatusLine#
  setlocal statusline+=%{luaeval('get_lsp_count()')}
  setlocal statusline+=%{%TabNumbers()%}
endfunction

augroup vimrc
  au!
  " show focused buffer statusline
  au VimEnter,WinEnter,BufEnter *
        \ call StatusLineInit()
  " show inactive buffer statusline
  au WinLeave,BufLeave * 
        \ call InactiveDecor()
augroup END

" Tab management key mappings
nnoremap tn :tabnew<CR>
nnoremap t1 :tabn 1<CR>
nnoremap t2 :tabn 2<CR>
nnoremap t3 :tabn 3<CR>
nnoremap t4 :tabn 4<CR>
nnoremap t5 :tabn 5<CR>
nnoremap t6 :tabn 6<CR>
nnoremap t7 :tabn 7<CR>
nnoremap t8 :tabn 8<CR>
nnoremap t9 :tabn 9<CR>

nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

" Function to rename the current tab
function! RenameTab()
  let l:new_name = input('New tab name: ')
  if !empty(l:new_name)
    let t:tab_name = l:new_name
    call UpdateTabline()
  endif
endfunction

" Update tabline to display custom tab names
function! UpdateTabline()
  set tabline=%!MyTabline()
endfunction

function! MyTabline()
  let s = ''
  for i in range(tabpagenr('$'))
    " Get the tab page number
    let tabnr = i + 1
    " Check if there's a custom name
    let tabname = gettabvar(tabnr, 'tab_name', 'Tab '.tabnr)
    " Highlight the current tab
    if tabnr == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " Set the tab page number (for mouse clicks)
    let s .= '%' . tabnr . 'T'
    " Add the tab name
    let s .= ' ' . tabname . ' '
  endfor
  " Fill the rest of the tabline
  let s .= '%#TabLineFill#%T'
  return s
endfunction

" Mapping to rename the current tab
nnoremap tr :call RenameTab()<CR>

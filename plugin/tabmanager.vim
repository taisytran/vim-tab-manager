" Default key mappings
let g:tabmanager_mappings = {
    \ 'new_tab': 'tn',
    \ 'tab1': 't1',
    \ 'tab2': 't2',
    \ 'tab3': 't3',
    \ 'tab4': 't4',
    \ 'tab5': 't5',
    \ 'tab6': 't6',
    \ 'tab7': 't7',
    \ 'tab8': 't8',
    \ 'tab9': 't9',
    \ 'next_tab': '<Tab>',
    \ 'previous_tab': '<S-Tab>',
    \ 'rename_tab': 'tr',
\ }

" Apply key mappings
for [key, mapping] in items(g:tabmanager_mappings)
    if has_key(g:, 'tabmanager_custom_mappings') && has_key(g:tabmanager_custom_mappings, key)
        let mapping = g:tabmanager_custom_mappings[key]
    endif
    execute 'nnoremap <silent>' mapping ' :' . key . '<CR>'
endfor

" Mapping to rename the current tab
nnoremap <silent> <Plug>(tabmanager-rename) :call tabmanager#RenameTab()<CR>
execute 'nnoremap <silent>' g:tabmanager_mappings['rename_tab'] ' <Plug>(tabmanager-rename)'

" Function to rename the current tab
function! tabmanager#RenameTab()
  let l:new_name = input('New tab name: ')
  if !empty(l:new_name)
    let t:tab_name = l:new_name
    call tabmanager#UpdateTabline()
  endif
endfunction

" Update tabline to display custom tab names
function! tabmanager#UpdateTabline()
  set tabline=%!tabmanager#MyTabline()
endfunction

function! tabmanager#MyTabline()
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

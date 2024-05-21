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

" Command mappings
let s:commands = {
    \ 'new_tab': 'tabnew',
    \ 'tab1': 'tabn 1',
    \ 'tab2': 'tabn 2',
    \ 'tab3': 'tabn 3',
    \ 'tab4': 'tabn 4',
    \ 'tab5': 'tabn 5',
    \ 'tab6': 'tabn 6',
    \ 'tab7': 'tabn 7',
    \ 'tab8': 'tabn 8',
    \ 'tab9': 'tabn 9',
    \ 'next_tab': 'tabnext',
    \ 'previous_tab': 'tabprevious',
    \ 'rename_tab': 'call RenameTab()',
\ }

" Apply key mappings
for [key, mapping] in items(g:tabmanager_mappings)
    if has_key(g:, 'tabmanager_custom_mappings') && has_key(g:tabmanager_custom_mappings, key)
        let mapping = g:tabmanager_custom_mappings[key]
    endif
    execute 'nnoremap <silent>' mapping ':' . s:commands[key] . '<CR>'
endfor

" Function to rename the current tab
function! RenameTab()
  let l:new_name = input('New tab name: ')
  if !empty(l:new_name)
    let t:tab_name = l:new_name
    call UpdateTabline()
  else
    echo "Tab name cannot be empty!"
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
nnoremap <silent> tr :call RenameTab()<CR>

if has('unix')
    let g:gf_match_regex = '\( \)\@<=\d\+$'
    let g:gf_replace_regex = ' \d\+$'
else
    let g:gf_match_regex = '\(:h\)\@<=\d\+$'
    let g:gf_replace_regex = ':h\d\+$'
endif

let g:gf_size_initial = matchstr(&guifont, g:gf_match_regex)

""
" Resets the GUI font size to its original value.
function! gui_font_size#reset() abort
  let l:new_font_size = ' '.g:gf_size_initial
  let &guifont = substitute(&guifont, g:gf_replace_regex, l:new_font_size, '')
endfunction

""
" Increases the GUI font size by [delta].
" @default delta=1
function! gui_font_size#increase(...) abort
  let l:delta = get(a:, 1, 1)
  let l:gf_size_whole = matchstr(&guifont, g:gf_match_regex)
  let l:gf_size_whole = l:gf_size_whole + delta
  let l:new_font_size = ' '.l:gf_size_whole
  let &guifont = substitute(&guifont, g:gf_replace_regex, l:new_font_size, '')
endfunction

""
" Decreases the GUI font size by [delta].
" @default delta=1
function! gui_font_size#decrease(...) abort
  let l:delta = get(a:, 1, 1)
  let l:gf_size_whole = matchstr(&guifont, g:gf_match_regex)
  let l:gf_size_whole = l:gf_size_whole - delta
  let l:new_font_size = ' '.l:gf_size_whole
  let &guifont = substitute(&guifont, g:gf_replace_regex, l:new_font_size, '')
endfunction

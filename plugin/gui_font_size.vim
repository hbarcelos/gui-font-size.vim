""
" @section Intro,intro
" @order intro commands mappings config
" @library
" Provides commands and mappings that allow users to easily control the font
" size when Vim is running in a GUI environment (i.e.: `gvim`).

""
" @section Config,config

""
" @setting g:gfs_create_default_mappings
" If `1` it creates the default mappings.
" Default: 1
"
let g:gfs_create_default_mappings = get(g:, 'gfs_create_default_mappings', 1)

if has('gui_running')
    ""
    " @section Commands, commands

    ""
    " Decreases the GUI font size by [delta].
    " @default delta=1
    command! -nargs=? GuiFontSizeDecrease :call gui_font_size#decrease(<f-args>)
    ""
    " Increases the GUI font size by [delta].
    " @default delta=1
    command! -nargs=? GuiFontSizeIncrease :call gui_font_size#increase(<f-args>)
    ""
    " Resets the GUI font size to its initial values.
    command! -nargs=0 GuiFontSizeReset    :call gui_font_size#reset()

    ""
    " @section Mappings, mappings
    " @subsection Plug Mappings
    " Defined `<Plug>` mappings:
    " >
    "     <Plug>(GFSDec)  :GuiFontSizeDecrease
    "     <Plug>(GFSInc)  :GuiFontSizeIncrease
    "     <Plug>(GFSRes)  :GuiFontSizeReset
    " <
    " @subsection Default Mappings
    " Key mappings created by default:
    " >
    "     <CTRL+->  <Plug>(GFSDec)
    "     <CTRL++>  <Plug>(GFSInc)
    "     <CTRL+0>  <Plug>(GFSRes)
    " <
    " If you do not wish to use the default mappings, you can overwrite the
    " @setting(g:gfs_create_default_mappings) config and define the mappings yourself:
    " >
    "     let g:gfs_create_default_mappings = 0
    "
    "     nmap <Leader><Up> <Plug>(GFSDec)
    "     nmap <Leader><Down> <Plug>(GFSDec)
    "     nmap <Leader><BS> <Plug>(GFSRes)
    " <
    " NOTICE: `<Plug>` mappings do not work with `noremap`.

    nnoremap <unique> <Plug>(GFSDec) :GuiFontSizeDecrease<CR>
    nnoremap <unique> <Plug>(GFSInc) :GuiFontSizeIncrease<CR>
    nnoremap <unique> <Plug>(GFSRes) :GuiFontSizeReset<CR>

    if (gfs_create_default_mappings == 1)
        nmap <unique> <silent> <C-_> <Plug>(GFSDec)
        " Ctrl++
        nmap <unique> <silent> <C-=> <Plug>(GFSInc)
        " Ctrl+0
        nmap <unique> <silent> <C-0> <Plug>(GFSRes)
    endif
endif

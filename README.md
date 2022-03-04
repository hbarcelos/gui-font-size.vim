# gui-font-size
Easily control font size on GUIs running Vim (i.e: `gvim`)

## Intro

Provides commands and mappings that allow users to easily control the font
size when Vim is running in a GUI environment (i.e.: `gvim`).

## Commands

```
:GuiFontSizeDecrease [delta]
  Decreases the GUI font size by [delta].
  [delta] is 1 if omitted.

:GuiFontSizeIncrease [delta]
  Increases the GUI font size by [delta].
  [delta] is 1 if omitted.

:GuiFontSizeReset
  Resets the GUI font size to its initial values.
```

## Mappings

### Plug Mappings
Defined `<Plug>` mappings:

```
<Plug>(GFSDec)  :GuiFontSizeDecrease
<Plug>(GFSInc)  :GuiFontSizeIncrease
<Plug>(GFSRes)  :GuiFontSizeReset
```

### Default Mappings
Key mappings created by default:

```
<CTRL+->  <Plug>(GFSDec)
<CTRL++>  <Plug>(GFSInc)
<CTRL+0>  <Plug>(GFSRes)
```

If you do not wish to use the default mappings, you can overwrite the
`g:gfs_create_default_mappings` config and define the mappings yourself:

```vim
let g:gfs_create_default_mappings = 0

nmap <Leader><Up> <Plug>(GFSDec)
nmap <Leader><Down> <Plug>(GFSDec)
nmap <Leader><BS> <Plug>(GFSRes)
```

**NOTICE:** `<Plug>` mappings do not work with `noremap`.

## Config

| Name                            | Type      | Description                             | Default
| :---                            | :---      | :---                                    | :---
| `g:gfs_create_default_mappings` | `boolean` | If `1` it creates the default mappings. | `1`


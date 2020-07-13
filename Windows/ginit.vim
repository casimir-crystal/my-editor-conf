" Set font, 
" I prefer Dejavu for command line, and FiraCode for editor.
"""GuiFont Dejavu Sans Mono for Powerline:h10
GuiFont FiraCode Nerd Font Mono

" Reset colorscheme
colorscheme NeoSolarized

" For Neovim-QT, map Ctrl+C as copy, and Ctrl+V as paste
" (only works in Visual mode and Insert mode to avoid the key conflict)
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+pa

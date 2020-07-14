" Set font
GuiFont FiraCode NF:h10

" For Neovim-QT, map Ctrl+C as copy, and Ctrl+V as paste
" (only works in Visual mode and Insert mode to avoid the key conflict)
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+pa

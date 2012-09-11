" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                              GUI stuff                                    |
" -----------------------------------------------------------------------------  
 
 
" OS Specific *****************************************************************
if has("gui_macvim")
 
  " fullscreen options (MacVim only), resized window when changed to fullscreen
  set fuoptions=maxvert,maxhorz 
  set guifont=Menlo\ for\ Powerline:h12
  " set guifont=Consolas:h12 
  set guioptions-=T  " remove toolbar
 
elseif has("gui_gtk2")
 
  set guifont=Monospace
  set guioptions-=T  " remove toolbar
 
elseif has("x11")
    set guifont=Monospace
elseif has("gui_win32")
end
 
" General *********************************************************************
set anti " Antialias font
colorscheme solarized
set background=dark

" Default size of window"
set columns=85 lines=60
 
" Tab headings 
set gtl=%t gtt=%F

" Window size Shortcuts.
nmap <leader>1 :set lines=60 columns=85<CR><C-w>o
nmap <leader>2 :set lines=60 columns=171<CR><C-w>v

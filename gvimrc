" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                              GUI stuff                                    |
" -----------------------------------------------------------------------------  
 
 
" OS Specific *****************************************************************
if has("gui_macvim")
 
  " fullscreen options (MacVim only), resized window when changed to fullscreen
  set fuoptions=maxvert,maxhorz 
  set guifont=Menlo:h12
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
set background=light

" Default size of window"
set columns=85 lines=70
 
" Tab headings 
set gtl=%t gtt=%F

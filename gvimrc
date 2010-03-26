" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                              GUI stuff                                    |
" -----------------------------------------------------------------------------  
 
 
" OS Specific *****************************************************************
if has("gui_macvim")
 
  set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
  set guifont=Menlo:h11
  set guioptions-=T  " remove toolbar
  let macvim_hig_shift_movement = 1 " mimic texedit 
  colorscheme ir_black 
 
elseif has("gui_gtk2")
 
  set guifont=Monaco
  set guioptions-=T  " remove toolbar
  colorscheme ir_black
 
elseif has("x11")
	set guifont=Monospace
	colorscheme ir_black
elseif has("gui_win32")
end
 
" General *********************************************************************
set anti " Antialias font

" Default size of window"
set columns=90 lines=65
 
" Tab headings 
set gtl=%t gtt=%F

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#show_splits = 0

let g:airline#extensions#tabline#show_tab_type = 1

" Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" Always show tabs
set showtabline=2

" Sections
let g:airline_section_c = ''
let g:airline_section_a = "Mach 2"
let g:airline_section_y = ''
let g:webdevicons_enable_airline_tabline = 1

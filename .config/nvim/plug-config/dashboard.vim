let g:dashboard_default_executive = 'fzf'
let g:dashboard_custom_header = [
            \ " ",
            \ " ",
            \ " ",
        \   "    =================     ===============     ===============   ========  ========",
        \   "    \\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
        \   "    ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
        \   "    || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
        \   "    ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
        \   "    || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
        \   "    ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
        \   "    || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
        \   "    ||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
        \   "    ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
        \   "    ||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
        \   "    ||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
        \   "    ||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
        \   "    ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
        \   "    ||   .=='    _-'          '-__\\._-'         '-_./__-'         `' |. /|  |   ||",
        \   "    ||.=='    _-'                                                     `' |  /==.||",
        \   "    =='    _-'                        N E O V I M                         \\/   `==",
        \   "    \\   _-'                                                                `-_   /",
        \    "    `''                                                                      ``'",
        \]

let g:dashboard_custom_footer = [
      \ '      Have fun with neovim ^_^       ',
      \ '',
      \ ]


let g:mapleader="\<Space>"
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>tc :Colors<CR>
nnoremap <silent> <Leader>fa :Rg<CR>
nnoremap <silent> <Leader>fb :Marks<CR>

let g:dashboard_custom_shortcut={
  \ 'last_session'       : 'SPC s l',
  \ 'find_history'       : 'SPC f h',
  \ 'find_file'          : 'SPC f f',
  \ 'change_colorscheme' : 'SPC t c',
  \ 'find_word'          : 'SPC f a',
  \ 'book_marks'         : 'SPC f b',
  \ }

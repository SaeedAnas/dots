
let g:startify_custom_header = [
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

let g:startify_custom_footer = [
      \ '      Have fun with neovim ^_^       ',
      \ '',
      \ ]


let g:startify_session_dir = '~/.config/nvim/session'


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction

let g:startify_bookmarks = [
            \ { 'c': '~/.config/sway/config' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/code',
            \ ]

let g:startify_enable_special = 0


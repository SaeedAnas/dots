let g:vimspector_enable_mappings = 'HUMAN'
autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>

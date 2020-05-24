" default syntax
let vimwiki_default = {}
let vimwiki_default.path = ''
let vimwiki_default.path_html = ''
let vimwiki_default.syntax = 'default'
let vimwiki_default.ext = '.wiki'
let vimwiki_default.name = 'DefaultSyntax'

" markdown syntax - https://github.github.com/gfm/
let vimwiki_markdown = {}
let vimwiki_markdown.path = ''
let vimwiki_markdown.path_html = ''
let vimwiki_markdown.syntax = 'markdown'
let vimwiki_markdown.ext = '.md'
let vimwiki_markdown.name = 'MarkdownSyntax'

" mediawiki syntax - https://www.mediawiki.org/wiki/Help:Formatting
let vimwiki_mediawiki = {}
let vimwiki_mediawiki.path = ''
let vimwiki_mediawiki.path_html = ''
let vimwiki_mediawiki.syntax = 'mediawiki'
let vimwiki_mediawiki.ext = '.mw'
let vimwiki_mediawiki.name = 'MediaWikiSyntax'

" register the 3 wikis
let g:vimwiki_list = [vimwiki_default, vimwiki_markdown, vimwiki_mediawiki]

source ~/.vam
:highlight Comment ctermfg=blue
set go-=T
set bg=dark
if &background == "dark"
    hi normal guibg=black
    set transp=8
endif

nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>
nmap <c-q> :bp \| bd#<CR>
nmap <a-p> :CtrlPBuffer
map <F6> :Bufferlist<CR>
set pastetoggle=<F7>

" Indentation
filetype indent plugin on
set autoindent

set hlsearch!
set nu

set noswapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux"

set omnifunc=syntaxcomplete#Complete

set runtimepath+=~/.vim/vim-addon-manager
call vam#ActivateAddons(['Auto_Pairs', 'Syntastic','Tagbar','ctrlp','The_NERD_tree', 'rails', 'netrw', 'The_NERD_Commenter', 'vim-coffee-script', 'buffet', 'surround', 'fugitive', 'vim-multiple-cursors', 'github:mattn/emmet-vim', 'ag', 'sleuth', 'notes', 'rails', 'vim-ruby', 'textobj-rubyblock', 'textobj-user', 'matchit.zip', 'dbext', 'SQLUtilities', 'better-whitespace', 'Rubytest', 'github:danchoi/ri.vim', 'eunuch', 'neocomplcache'], {'auto_install' : 0})
let g:AutoPairsFlyMode = 1
set hidden
let g:AutoPairsShortcutBackInsert = '<C-l>'
let g:UltiSnipsListSnippets="<F2>"
set clipboard=unnamed
set rtp+=~/.fzf

set foldmethod=syntax

" Set up backups
set backup
set backupdir=~/.vim/tmp/backups
set writebackup

" Set all swap-files to go into a central directory
set swapfile
set dir=~/.vim/tmp/swapfiles

" neocomplcache config
" Setting examples:
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

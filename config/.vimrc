"source ~/.colemak.vim
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
set smartindent
set autoindent
set tabstop=2
set sts=2
set shiftwidth=2
set expandtab
set hlsearch!
set runtimepath+=~/.vim/vim-addon-manager
set nu
set noswapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux"
" ,'UltiSnips',
call vam#ActivateAddons(['Auto_Pairs', 'Syntastic','Tagbar','ctrlp','The_NERD_tree', 'rails', 'netrw', 'The_NERD_Commenter', 'vim-coffee-script', 'buffet', 'surround', 'fugitive', 'vim-multiple-cursors', 'github:mattn/emmet-vim', 'ag', 'vim-ruby'], {'auto_install' : 0})
let g:AutoPairsFlyMode = 1
set hidden
let g:AutoPairsShortcutBackInsert = '<C-l>'
let g:UltiSnipsListSnippets="<F2>"
" load indent file for the current filetype
filetype indent on
set clipboard=unnamed

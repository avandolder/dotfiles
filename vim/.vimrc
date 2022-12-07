set expandtab tabstop=4 shiftwidth=4 sts=4
set autoindent
set nu
set mouse=a

com Spell set spell spelllang=en_ca
com Unspell set spell spelllang=
com W w

autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType lua :setlocal sw=2 ts=2 sts=2
autocmd FileType cpp :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2

autocmd BufRead,BufNewFile *.ron setfiletype rust
autocmd FileType rust :setlocal colorcolumn=100

set viewoptions=cursor,folds,slash,unix

" Protect against changes between writes
set swapfile
set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
set nobackup
set backupcopy=auto

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

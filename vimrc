" Get numbered lines
set number

" Auto-indent
filetype indent on

" make tab 4 spaces
set ts=4 sw=4

" Set dark background.
" Without this, vim has different colors
" in tmux. See https://unix.stackexchange.com/questions/348771/why-do-vim-colors-look-different-inside-and-outside-of-tmux.
set background=dark

" Highlighted search
set hlsearch

" Install plugins using vim-plug
call plug#begin()
	Plug 'airblade/vim-gitgutter'
call plug#end()

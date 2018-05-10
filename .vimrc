set nocompatible              " be iMproved, required for vundle
filetype off                  " required for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'bufexplorer.zip'
Plugin 'ctrlp.vim' 
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'jgdavey/tslime.vim'
Plugin 'klen/python-mode'
Plugin 'lervag/vimtex'
"Plugin 'lukerandall/haskellmode-vim'
Plugin 'majutsushi/tagbar'
Plugin 'matchit.zip'
Plugin 'mattn/emmet-vim'
"Plugin 'mileszs/ack.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/vimfiler.vim'
Plugin 'sjl/gundo.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

"set rtp+=/usr/local/Cellar/fzf/0.10.1 "for fzf

let mapleader=","
set cursorline " highlight current line
"set cursorcolumn
syntax on 
set nu "Line numbers
set tw=0
set tabstop=4 softtabstop=0 shiftwidth=4
"set noexpandtab
set smartindent
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType haskell setlocal expandtab shiftwidth=4 softtabstop=4
"filetype settings in /usr/local/Cellar/macvim/HEAD/MacVim.app/Contents/Resources/vim/runtime/syntax
"additionally can add settings to ~/.vim/after or ~/.vim/indent
"filetype indent off
set laststatus=2
set hidden "close buffers without needing to save

"don't make backups
set nobackup
set noswapfile
set showcmd
set clipboard=unnamed "yank to clipboard by default

set ignorecase
set smartcase "ignores case if all lowercase when searching
set incsearch "shows matches as you type
nnoremap <silent><leader>hl :call Togglehlsearch()<CR>

au FileType qf wincmd J "quickfix pane always takes up whole bottom

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>q :close<CR>
nnoremap <leader>nrw :close<CR>

let g:NERDTreeHijackNetrw=0 "still use netrw as default
map <C-n> :NERDTreeToggle<CR> 
nnoremap <leader>nt :NERDTreeFind<CR>

nnoremap <leader>be :BufExplorer<CR>
nnoremap <leader>tb :TagbarToggle<CR>

let g:pymode_folding = 0

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#auto_completion_start_length = 3

set runtimepath^=~/.vim/bundle/ctrlp.vim "necessary for ctrlp
let g:ctrlp_working_path_mode = 'w' "search within subdirs of current working directory
let g:ctrlp_match_window_reversed = 0 "show files top to bottom
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth=5
let g:ctrlp_by_filename = 0 "search by filename by default
let g:ctrlp_use_caching = 1

let g:airline#extensions#tabline#enabled = 1 "for airline extension

set wildmenu
set nowrap

" ignore specific directories and files
set wildignore+=*.min.* "don't really know how this works

let t_Co=256
set background=dark
colorscheme molokai
"colorscheme solarized

"dont insert by default with o
"nnoremap O O<ESC>
"nnoremap o o<ESC>
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

"yank till end of line
nnoremap Y y$

"for inserting braces
inoremap {<CR> {<Esc>o<Tab><CR>}<Esc>kxA
"select all
noremap <C-a> <Esc>ggVG

"for autocentering on position shifts
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

" Use ctrl-[hjkl] to select the active split
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>

nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tn :tabnext<CR>

" for swapping buffers in split windows
nnoremap ˙ :wincmd H<CR>
nnoremap ¬ :wincmd L<CR>
nnoremap ∆ :wincmd J<CR>
nnoremap ˚ :wincmd K<CR>

"open current file in Finder, looks like command! will only define the command once
command! Finder :!open %:p:h
command! Subl :!subl %:p:h

function! Togglehlsearch()
	if &hlsearch == 0
		set hlsearch
	else
		set nohlsearch
	endif
endfunction

"function to get output of message, Usage- :TabMessage <cmd>
function! TabMessage(cmd)
	redir => message
	silent execute a:cmd
	redir END
	tabnew
	silent put=message
	set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)

let g:pymode_rope = 0
set completeopt-=preview

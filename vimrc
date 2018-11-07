colorscheme badwolf
syntax enable

set statusline+=%f

" tab/space formatting
set shiftwidth=4
set tabstop=4

autocmd FileType python setlocal expandtab softtabstop=4
autocmd FileType haskell setlocal expandtab softtabstop=4
autocmd FileType sh setlocal expandtab softtabstop=4
" line numbers on
set number

" graphical tab complete menu
set wildmenu

" highlight matching parens
set showmatch

" better searching
set incsearch	" search as chars are entered
set hlsearch	" highlight matches

set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","	"leader is comma

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc and bashrc, load vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>eb :vsp ~/.bashrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

execute pathogen#infect()
call pathogen#helptags()

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

let NERDTreeGlyphReadOnly=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <C-w> <C-w>w
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

function! CloseNerdTree()
  if exists("b:NERDTreeType")  
	:NERDTree
	:q
  endif
endfunction

inoremap <C-q> call CloseNerdTree()

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

set lazyredraw
set ttyfast

filetype plugin indent on

if &term =~ '256color'
    set t_ut=
endif

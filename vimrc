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
syntax on
filetype plugin indent on
call pathogen#helptags()

nnoremap <C-w> <C-w>w
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

filetype plugin indent on

if &term =~ '256color'
    set t_ut=
endif

autocmd vimenter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1

set termguicolors
let g:miramare_enable_italic = 1
let g:miramare_disable_italic_comment = 1
let g:miramare_transparent_background = 0
colorscheme miramare

let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

let g:ycm_autoclose_preview_window_after_completion = 1

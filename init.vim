call plug#begin('~/.config/nvim/plugged')
	"Plug 'Github계정명/저장소명'"
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'pbondoer/vim-42header'
	Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	"Plug 'jiangmiao/auto-pairs'
	Plug 'Yggdroot/indentLine'
	Plug 'pangloss/vim-simplefold'
	Plug 'tommcdo/vim-lion'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'shime/vim-livedown'
	"Plug 'TimothyYe/vim-ydict'
	Plug 'dominikduda/vim_current_word'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'} 
	Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} 
	"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
	"Plug 'SirVer/ultisnips'
call plug#end()
let g:hdr42user = 'hyulim'
let g:hdr42mail = 'hyulim@student.42seoul.kr'
colorscheme gruvbox
"let g:airline_thee='gruvbox'
let g:airline_theme='gruvbox'

if has("syntax")
	syntax on
endif

map <F3> <ESC>:NERDTreeToggle<CR>
let NERDTreeIgnore=['\.a$', '\.o$', '\.gch$', 'a\.out' , '\~$']    "ignore files in NERDTree

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" customize keymapping
" \ (backslash) + c + space = comment swtich
map <Leader>c<space> <plug>NERDComComment
"map <Leader>cc <plug>NERDComToggleComment

set nu
set ruler
set ts=4
set sts=4
set sw=4
set si
set ci
set ai
set title
set showmatch
set colorcolumn=80
set cursorline
set background=dark
set hlsearch
set mouse=a
filetype on
set enc=UTF-8
set fileencoding=UTF-8

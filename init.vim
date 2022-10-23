" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: taeng <taeng@innoaca.kr>                   +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2022/02/19 11:34:36 by taeng             #+#    #+#              "
"    Updated: 2022/09/17 14:13:36 by hyulim           ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

let g:python_recommended_style = 0
set nu
set ruler

"set tabstop=8
"set softtabstop=0
"set expandtab
"set shiftwidth=4
"set smarttab

set ts=4
set sw=4
set sts=4
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
"set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
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
        Plug 'vim-syntastic/syntastic'
        Plug 'alexandregv/norminette-vim'
call plug#end()
let g:hdr42user = 'hyulim'
let g:hdr42mail = 'hyulim@student.42seoul.kr'
"let g:hdr42user = 'taeng'
"let g:hdr42mail = 'hyundong@innoaca.kr'
colorscheme gruvbox
"let g:airline_thee='gruvbox'
let g:airline_theme='gruvbox'

if has("syntax")
        syntax on
endif

map <F3> <ESC>:NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

"ignore files in NERDTree
let NERDTreeIgnore=['\.a$', '\.o$', '\.gch$', 'a\.out' , '\~$']

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
"map <Leader>c <space> <plug>NERDComComment
"map <Leader>cc <plug>NERDComToggleComment

"Coc-nvim
"let g:python3_host_prog = '/usr/bin/python3.8'
let g:python3_host_prog = 'python3'
let g:coc_global_extensions = ['coc-python', 'coc-clangd', 'coc-explorer', 'coc-json', 'coc-tsserver', 'coc-import-cost', 'coc-eslint', 'coc-snippets', 'coc-html', 'coc-css', 'coc-emmet', 'coc-pyright']
let g:coc_global_extensions += ['https://github.com/andys8/vscode-jest-snippets']
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Enable norminette-vim (and gcc)
let g:syntastic_c_checkers = ['norminette', 'gcc']
let g:syntastic_aggregate_errors = 1

" Set the path to norminette (do no set if using norminette of 42 mac)
let g:syntastic_c_norminette_exec = 'norminette'

" Support headers (.h)
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['include', '../include', 'libft']

" Pass custom arguments to norminette (this one ignores 42header)
let g:syntastic_c_norminette_args = '-R CheckTopCommentHeader'

" Check errors when opening a file (disable to speed up startup time)
let g:syntastic_check_on_open = 1

" Enable error list
let g:syntastic_always_populate_loc_list = 1

" Automatically open error list
let g:syntastic_auto_loc_list = 1

" Skip check when closing
let g:syntastic_check_on_wq = 0

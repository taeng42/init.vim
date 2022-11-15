" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: taeng <taeng@innoaca.kr>                   +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2022/02/19 11:34:36 by taeng             #+#    #+#              "
"    Updated: 2022/11/15 09:07:08 by hyulim           ###   ########.fr        "
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
        "Plug 'dawnbeen/c_formatter_42'
        Plug 'cacharle/c_formatter_42.vim'

call plug#end()
let g:hdr42user = 'hyulim'
let g:hdr42mail = 'hyulim@student.42seoul.kr'
"let g:hdr42user = 'taeng'
"let g:hdr42mail = 'hyundong@innoaca.kr'
colorscheme gruvbox
let g:airline_theme='gruvbox'

if has("syntax")
        syntax on
endif

map <F3> <ESC>:NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

"ignore files in NERDTree
let NERDTreeIgnore=['\.a$', '\.o$', '\.gch$', 'a\.out' , '\~$']

let g:NERDTreeMouseMode=3

let g:NERDTreeWinPos = 'left'

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
let g:coc_global_extensions = ['coc-clangd', 'coc-explorer', 'coc-json', 'coc-tsserver', 'coc-import-cost', 'coc-eslint', 'coc-snippets', 'coc-html', 'coc-css', 'coc-emmet', 'coc-pyright']
let g:coc_global_extensions += ['https://github.com/andys8/vscode-jest-snippets']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Custom keymappings] see plugin/coc.vim
" ---------------------------------------

" Go to definitions
"noremap <silent> <F12> :CocJumpDefinition<CR>
"command! -nargs=0 CocJumpDefinition :call CocActionAsync('jumpDefinition')
"command! -nargs=0 JumpDefinition :call CocActionAsync('jumpDefinition')

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Symbol renaming. (leader == \ )
nmap <leader>rn <Plug>(coc-rename)

" Map 'J' for showing documentation in preview window
" Use command ':verbose map J' to make sure it does not have conflict
" with other plugins (e.g. python-mode, jedi-vim)
nnoremap <silent> J :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Experimental feature (preview definition): gp, `<leader>K`, or <Shift-F12>:
" Peek into the definition in a floating window.
" TODO: If there are 2+ definitions, it does not work with floating windows (coc.nvim problem)
command! -nargs=0 PreviewDefinition :call CocActionAsync('jumpDefinition', ':OpenAsPreview')
command! -nargs=* OpenAsPreview :call s:open_as_preview("<args>")
function! s:open_as_preview(callstr)
  " e.g. the string should look like: +call cursor(<line>,<col>) <filename>
  let m = matchlist(a:callstr, '^+call cursor(\(\d\+\),\s*\(\d\+\))\s\+\(.*\)')
  if len(m) < 4   " TODO: more robust error handling
    echohl WarningMsg | echom "ERROR: Invalid callstr format" | echohl None
    return
  endif
  let linenr = m[1]
  let filename = expand(m[3])
  call quickui#preview#open(filename, {
        \ 'cursor': linenr,
        \ 'number' : 1,
        \ 'persist': 0,
        \ })
endfunction
" <F24> = <Shift-F12>
"nmap <silent> <F12>         :<C-U>PreviewDefinition<CR>
"nmap <leader>J     :<C-U>PreviewDefinition<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Enable norminette-vim (and gcc)
let g:syntastic_c_checkers = ['norminette', 'gcc']
let g:syntastic_aggregate_errors = 1

" Set the path to norminette (do no set if using norminette of 42 mac)
let g:syntastic_c_norminette_exec = 'norminette'

" Support headers (.h)
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['includes', '../includes', 'libft']

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

" set default formatter as c_formatter_42
let g:c_formatter_42_set_equalprg=1

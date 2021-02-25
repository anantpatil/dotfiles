" set soft wrap, automatic line break
" show breaks in like with ...
" set nolist as it messes up with linebreak
syntax on
set wrap lbr nolist showbreak=…
"set sw=4 "Use this when coding python
set sw=4
set ai wm=5 sm
set smarttab
set smartindent
set expandtab
set textwidth=72
"colorscheme slate
if has('gui_running')
    "For GUI, colorscheme is solarized dark
    "colorscheme solarized
    colorscheme default
    "colorscheme zenburn
    set background=light
else
    "colorscheme default
endif

"set guifont=Inconsolata-dz\ Medium\ 9
"set guifont=monospace\ Medium\ 9
"set guifont=Source\ Code\ Pro\ Medium:h11
"set guifont=M+\ 2m\ Medium\ 9
set guifont=Monaco:h11
"set guifont=Menlo\ Regular:h12

"to automatically format text as and when edited.
" set formatoptions+=a 

" highlight search matches
set hlsearch

" Press Space to turn off highlighting and clear any
" message already displayed.  
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

" Following will map F8 to hghlight the occurences of current word
" * and # are used to search the current word forward and backword
:nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" set lang to en_gb
setlocal spelllang=en_gb

" Press F2 to toggle spell check on/off, and show current value.
:noremap <F2> :setlocal spell! spell?<CR>


" Press F7 to toggle syntax highlighting on/off
:map <F7> :if exists("g:syntax_on") <Bar>
    \   syntax off <Bar>
    \ else <Bar>
    \   syntax enable <Bar>
    \ endif <CR>

" Use external paragraph formatter par
" par is powerful paragraph formatter
" set formatprg=par\ -w40 for width 40
" use gq to format using par and gw to use vim's formatter
" q option to handle nested quotations in plain text e-mail.
" Use j option to justify text
" repeat characters in bodiless lines
" set formatprg=par\ -w72qrj
" i have kep for q option for mail editing
set formatprg=par\ -w72q

" load vimrc for editing on one command ,v
" to source vimrc file, issue :source $MYVIMRC
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" set incremental search
set incsearch

" Pathogen
" execute pathogen#infect()

" Open NERD_Tree when no files are specified
"autocmd vimenter * if !argc() | NERDTree | endif

" Open nerd tree with Ctrl-N
"map <C-n> :NERDTreeToggle<CR>

" For ctrl-P
"set runtimepath^=~/.vim/bundle/ctrlp.vim

" To have relative line numbers in normal mode for fast movement
" set relativenumber
autocmd insertEnter * :set number
autocmd insertLeave * :set relativenumber

"When not in focus just show line number,
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Using junegunn/vim-plug for managing packages
call plug#begin()
Plug 'tpope/vim-sensible',
Plug 'fatih/vim-go',
Plug 'tpope/vim-fugitive'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
call plug#end()

let python_highlight_all=1
syntax on

" For toggling light/dark background 
call togglebg#map("<F5>")

:map <C-C> :q! <Enter>

" Disable indentLines by default.
" Use IndentLinesToggle to toggle.
let g:indentLine_enabled = 0

" pip install flake8 and pylint to use syntastic properly
"let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_python_checkers = ['flake8', 'pylint']
"let g:syntastic_python_checkers = ['pylint']

" Flake8, use F3
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
let g:flake8_show_quickfix=0  " don't show
"let g:flake8_show_quickfix=1  " show (default)
"let g:flake8_show_in_gutter=0  " don't show (default)
let g:flake8_show_in_gutter=1  " show
let g:flake8_error_marker='EE'     " set error marker to 'EE'
let g:flake8_warning_marker='WW'   " set warning marker to 'WW'
" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
" Run flake8 after every save
autocmd BufWritePost *.py call Flake8()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.


Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'lifepillar/vim-solarized8'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kburdett/vim-nuuid'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'valloric/YouCompleteMe'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set autoread
set nocompatible
set hidden
set number
set ruler
set history=50
set showcmd
"filetype plugin indent on
set backspace=eol,indent,start
set vb
" Highlights cursor line
set cursorline

" Set high undo levels
set undolevels=300

" jj to escape insert mode
inoremap jj <Esc>

"Shortcuts using leader
"Fast Saving
nnoremap <C-w> :w!<cr>
nnoremap <C-x> :x<cr>

" Keep cursor away from edges
set scrolljump=5
set scrolloff=3


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab Spacing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set hlsearch
" Ignore case during search
set ic

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl+n to toggle NERDTree
map <C-n> :NERDTreeToggle %<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeDirArrowExpandable = '>'
"let g:NERDTreeDirArrowCollapsible = '>'
let NERDTreeShowHidden=1

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline_theme='base16_embers'

" Solarized Settings
syntax enable
set background=dark
let g:solarized_termtrans=1
colorscheme solarized
let g:solarized_termcolors=256

" Ctrl P
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*

"let g:syntastic_debug = 3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':[],'passive_filetypes': [] }
nnoremap <C-c> :SyntasticCheck<CR>


let g:syntastic_filetype_map = {'json': 'javascript'}
let g:syntastic_javascript_checkers=['']
let g:syntastic_python_checkers=['pylint']
"let g:syntastic_python_checkers=['pylint', 'mypy']
let g:syntastic_python_python_exec = '/usr/bin/python3.6'
let g:syntastic_bash_checkers=['shellcheck']


" You complete me
"nnoremap <C-l> :YcmCompleter GoToDefinition<cr>
nnoremap <C-l> :vs \| YcmCompleter GoToDefinition<cr>
nnoremap <C-g> :YcmCompleter GetDoc<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow

nnoremap <C-y> :! black -l 80 %
"Remap move windows
nnoremap <C-p> <C-w>w

"Shortcuts using CTRL
"Tab shortcuts
nnoremap <C-j> :bn<cr>
nnoremap <C-k> :bp<cr>
nnoremap <C-i> :bn<cr>:bd#<cr>

"Cursor wrapping, which wraps arrow keys
set whichwrap+=<,>,h,l,[,]

"Folding stuff
au BufNewFile,BufRead *.py set foldmethod=indent
au FileType cpp set foldmethod=syntax
au FileType c set foldmethod=syntax
map <space> za
set foldnestmax=1

" move vertically by visual line
nnoremap j gj
nnoremap k gk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimrc Behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No backups and swaps
set nobackup
set noswapfile

"Source .vimrc once it's been edited
autocmd! bufwritepost .vimrc source ~/.vimrc

"Reload files after vimrc has been edited
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC| if has('gui_running') | so $MYGVIMRC | endif
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Send more characters for redraws
set ttyfast
" Configure vim for mouse input
set mouse=a
set ttymouse=xterm2


set t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Max Length check
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the maximal line length to 80 characters
function ShowLongLine()
match ErrorMsg '\%81v.\+'
endfunction

command R call ShowLongLine()

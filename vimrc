""" It's called 'improved' for a reason
set nocompatible

""" START VUNDLE SETUP
filetype off " Vundle requires this for now, but we'll turn it back on later.

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

""" Let's steal some things from Tim Pope

" Tim Pope's gold standard for git-vim integration
Plugin 'tpope/vim-fugitive'
" Search, abbreviate, and replace variants of a word---refactoring in a box
Plugin 'tpope/vim-abolish'
" Do things with brackets, tags, and more
Plugin 'tpope/vim-surround'
" Manipulate comments
Plugin 'tpope/vim-commentary'
" Make . work with plugins
Plugin 'tpope/vim-repeat'
" Change dates and times with C-A and C-X 
Plugin 'tpope/vim-speeddating'
" Set some reasonable defaults
Plugin 'tpope/vim-sensible'
" Add readline-style commands to insert and command line modes; cross the streams, try not to destroy the world
Plugin 'tpope/vim-rsi'
" It's a vim plugin for writing vim plugins
Plugin 'tpope/vim-scriptease'
" Charmap for vim
Plugin 'tpope/vim-characterize'

" Swap things around with cx 
Plugin 'tommcdo/vim-exchange'
" Automatically detect expandtab and tab width if possible
Plugin 'ciaranm/detectindent'
" Add git diff markings in the gutter
Plugin 'airblade/vim-gitgutter'
" Line things up
Plugin 'godlygeek/tabular'
" Automatically close delimiters
Plugin 'Raimondi/delimitMate'
" Do the same for XML tags
Plugin 'docunext/closetag.vim'
" clang bindings
Plugin 'Rip-Rip/clang_complete'
" Better undo support
Plugin 'sjl/gundo.vim'
" Syntax checking for all manner of things
Plugin 'scrooloose/syntastic'
" Tab-complete all the things
Plugin 'ervandew/supertab'
" Solarized colorscheme
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""" END VUNDLE SETUP

""" BEGIN PLUGIN CONFIGURATION

" Force sensible to load now so we can override it later if desired
runtime! plugin/sensible.vim

" Make F5 toggle the undo tree
nnoremap <F5> :GundoToggle<CR>


""" END PLUGIN CONFIGURATION

syntax on

""" Indentation options
set expandtab
set shiftwidth=4 
set tabstop=4 
set softtabstop=4
set autoindent
set smartindent

""" Matching punctuation
set showmatch

""" better search
set grepprg=grep\ -nH\ $*

""" cursor anywhere
"""set virtualedit=all

""" line wrapping
set comments+=b:\"
set comments+=b:\#

""" tab completion
set wildmode=list:longest,full
""" Use [RO] for readonly in message line
set shortmess+=r

set modeline
set ruler
set nu
set laststatus=2
set showcmd
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬
set list

""" Don't spell check by default
set nospell

if has("autocmd")
    filetype on

    autocmd BufRead,BufNewFile *.sig set filetype=sml

    autocmd BufRead,BufNewFile *.bcs set filetype=cs
    autocmd BufRead,BufNewFile *.bcsh set filetype=cs

    autocmd FileType mail,human set formatoptions+=t textwidth=76 wrap spell

    """ For C-like programming, autoindent and wrap
    autocmd FileType c,cpp,slang set cindent formatoptions+=c

    """ For actual C (not C++) where comments have explicit end ccharacters, if
    """ starting a new line in the middle of a comment automatically insert the
    """ comment leader characters
    autocmd FileType c set formatoptions+=ro

    """ For Perl, make braces indent themselves
    autocmd FileType perl set makeprg=perl\ -c\ %\ $*
    autocmd FileType perl set errorformat=%f:%l:%m
    autocmd FileType perl set autowrite

    """in makefiles, don't expand tabs to spaces, and set tabstop at 8 chars
    autocmd FileType make set noexpandtab tabstop=8 softtabstop=8 shiftwidth=8

    """ spell-check mail files
    autocmd filetype mail set spell
endif

""" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

""" make ',e' in normal mode give a prompt for opening files in the same dir
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . "/"<CR>
else
    map ,e :e <C-R>=expand("%:p:h") . "\\"<CR>
endif

""" Spell checking
set spelllang=en_us

set background=dark
colorscheme desert

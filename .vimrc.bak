set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 
Plugin 'scrooloose/nerdtree' 
Plugin 'tpope/vim-fugitive' 
Plugin 'junegunn/fzf.vim'
Plugin 'rking/ag.vim'
"use pacman -S fzf the_silver_searcher(silver-searcher-git)
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'osyo-manga/vim-marching'
Plugin 'vim-latex/vim-latex'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Chiel92/vim-autoformat'
Plugin 'vim-syntastic/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
"install latex-mk firstly
" for makrdown preview
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/goyo.vim'
Plugin 'lambdalisue/gina.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'moll/vim-node'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Turn on syntax highlighting
syntax on

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" unfold all codes
set nofoldenable

" Whitespace
set listchars=tab:>-,trail:-,eol:$ list
set shiftwidth=4 
set tabstop=4 
set expandtab

" Rendering
set ttyfast

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Color scheme (terminal)
set t_Co=256
set background=dark
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme tender
hi Normal guibg=NONE ctermbg=NONE

"set backup location
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

"settings for plugins
"
"Goyo
map <F6> :Goyo<CR>
"
"Nerdtree
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Tagbar
nmap <F12> :TagbarToggle<CR>

"latex preview
nmap <F9> :LLPStartPreview<CR>
"tab operation
nmap <C-u> :tabp<CR>
nmap <C-i> :tabn<CR>
nmap <C-y> :tabnew<CR>
nmap <C-o> :tabclose<CR>

"autofomat
nnoremap <C-f> :Autoformat <CR>

"set local leader key
let g:mapleader = "\\"

" for ycm problem, cd ~/.vim/bundle/youcompleteme && ./install.py

"syntastic checking settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"settings for multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-]>'
let g:multi_cursor_select_all_word_key = '<A-]>'
let g:multi_cursor_start_key           = 'g<C-]>'
let g:multi_cursor_select_all_key      = 'g<A-]>'
let g:multi_cursor_next_key            = '<C-]>'
let g:multi_cursor_prev_key            = '<C-[>'
let g:multi_cursor_skip_key            = '<C-\>'
let g:multi_cursor_quit_key            = '<Esc>'

" neocomplete configuration
let g:neocomplete#enable_at_startup = 1
let g:acp_enableAtStartup = 0
let g:neocomplete#sources#syntax#min_keyword_length = 5

"neospippet configuration
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'

"live preview
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'
let g:livepreview_cursorhold_recompile = 0

"vimtex settings
let g:vimtex_compiler_engine = 'xelatex'
let g:vimtex_compiler_latexmk = {'callback' : 0}

"vim-syntastic
nmap <F8> :SyntasticToggleMode<CR>
let g:syntastic_tex_checkers = []
let g:syntastic_check_on_open = 0
let g:syntastic_mode_map = { 'mode': 'passive'}

"set clipboard
" install gvim firstly rather than vim itself. uninstall vim and install gvim
set clipboard=unnamedplus

"markdown preview
nnoremap <F7> :MarkdownPreview<CR>
nnoremap <S-F7> :MarkdownPreviewStop<CR>

"map jj to Esc
imap jj <Esc>

"vim-aireline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1

"vim-marching
let g:marching_enable_neocomplete=1

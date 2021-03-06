" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

runtime autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" ================ General Config ====================
"set t_Co=256
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set ruler
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window. 
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works in MacVim (gui) mode.

if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ================ Highlight over 80 chars ==========
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#F3F3F3
set colorcolumn=85
highlight ColorColumn guibg=Gray14
"highlight OverLength ctermbg=white ctermfg=darkred guibg=#F3F3F3
"match OverLength /\%81v.*/

" ================ pylint ===========================
"autocmd FileType python compiler pylint
"
" ================ NERDTree =========================
autocmd VimEnter * NERDTree
"autocmd BufWinEnter * NERDTreeMirrorOpen
autocmd VimEnter * wincmd p
let g:nerdtree_tabs_focus_on_files=1
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :NERDTreeTabsOpen<CR>

" ================ Tagbar =========================
autocmd VimEnter * TagbarOpen
nmap <F8> :TagbarToggle<CR>

" ================ CTRL+P ===========================
set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

autocmd VimEnter * nnoremap <C-S-P> :CtrlPTag<cr>

" ========== Disable JS Indent logging ==============
let g:js_indent_log = 0

" ============ colorscheme ==========================
"colorscheme molokaigo
"colorscheme gentooish
"let g:molokai_original = 1


"============= Go language plugins =================
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif
set runtimepath+=$GOROOT/misc/vim " replace $GOROOT with the output of: go env GOROOT
filetype plugin indent on
syntax on
autocmd FileType go compiler go

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au BufWritePost *.go silent! !ctags --exclude=*.html --exclude=*.js ./*.go &


"============= Autocompletion =================
let g:neocomplete#enable_at_startup = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" close scratch window
inoremap <silent> <CR> <CR><c-o>:pclose<CR>



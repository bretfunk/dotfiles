"===================================SETTINGS========================================
set t_co=256                       "256 colors
set termguicolors                  "true color
set tabstop=2                      "2 spaces for tab
set shiftwidth=2                   "2 spaces for tab
set softtabstop=2                  "2 spaces for tab
set expandtab                      "no tabs
set nowrap                         "no softwrap
set noshowmode                     "don't show insert in echo area
set foldlevel=10                   "start with a big fold
set list                           "show tab characters
set timeoutlen=1000 ttimeoutlen=-1 "better timeouts
set number                         "line numbers
set relativenumber                 "line numbers
set mouse=a                        "use the mouse
set cindent                        "auto indent
set foldmethod=syntax              "code folding
set textwidth=80                   "format at 80 lines
set ls=2                           "better status line
set clipboard=unnamedplus              "use system clipboard
set hidden                         "allow jumping back and forth between multiple unsaved buffers
set noshowmode                     "because airline...
set visualbell                     "no sounds!
set ignorecase                     "ignore case when searching
set smartcase                      "don't ignore when I specify
set wildignorecase                 "case insensitive file search
set inccommand=nosplit             "show replaces while typing
set backup                         "backups
set noswapfile
set backupdir=~/.config/nvim/backup
set diffopt=vertical               "vertical diff splits
set updatetime=2000                "a bit faster updatetime
set shortmess+=c                   "make that mess shorter?
:let mapleader = ' '               "leader is space
:let maplocalleader = ','          "localleader is comma
"au! QuickFixCmdPost [^l]* cwindow  "open quickfix after search
"au! QuickFixCmdPost l* lwindow     "open quickfix after search
"au! InsertLeave * pc               "close preview on insert leave
set incsearch                      " Find the next match as we type the search
set hlsearch                       " Highlight searches by default
set autoread                        "auto loads changed file, like when changing branches
"===================================IGNORE======================================
set wildignore+=*/_build
set wildignore+=*/.cljs_rhino_repl
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=.git
set wildignore+=.venv
set wildignore+=*/dist
"===================================FUNCTIONS===================================
func! StripTrailingWhitespace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunc

" check if buffer has changed one time after 4s of inactivity in normal mode
" this is related to autoload and is for when you are changing branches
au CursorHold * checktime

"Clear trailing whitespace
au! BufWritePre * silent call StripTrailingWhitespace()

func! OpenOrCreateTerminal()
  let term = bufname('term://')
  if bufexists(term)
    :buffer term
  else
    :terminal
  endif
endfunc

let flowreadable = filereadable('./.flowconfig')

" override $VISUAL to use nvr inside neovim
if executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
"==================================PLUGINS===================================
call plug#begin('~/.vim/plugged')
"==================================COSMETIC===============================
Plug 'sonph/onehalf'
Plug 'jacoborus/tender'
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
let g:rainbow_active = 1
"airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
"==================================UTILITY===============================
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
"case insensitive search that keeps the case of whatever you change
Plug 'tpope/vim-abolish'
"fugitive is for git commands
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
"====================================BUILD/TEST=================================
Plug 'w0rp/ale'
Plug 'janko-m/vim-test'
let g:ale_linters = {
      \ 'elixir': ['mix', 'credo', 'dialyxir'],
      \ 'haskell': ['stack-ghc-mod', 'hlint'],
      \ 'elm': ['elm-make'],
      \ 'javascript': ['flow', 'prettier'],
      \ 'javascript.jsx': ['flow', 'prettier'],
      \ 'typescript': ['tsserver', 'tslint'],
      \ 'typescript.tsx': ['tsserver', 'tslint']
      \ }
let g:ale_linters_explicit = 1
let g:test#strategy = 'neovim'
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'javascript.jsx': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'typescript.tsx': ['prettier'],
      \ 'elixir': ['mix_format']
      \ }
let g:ale_fix_on_save=1
"==================================NAVIGATION===================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ggreer/the_silver_searcher'
"==================================AUTOCOMPLETION===============================
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
Plug 'ervandew/supertab'
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_rootMarkers = {'elixir': ['mix.exs']}
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'javascript': flowreadable ? ['flow-language-server', '--stdio', '--try-flow-bin'] : ['javascript-typescript-stdio'],
      \ 'javascript.jsx': flowreadable ? ['flow-language-server', '--stdio', '--try-flow-bin'] : ['javascript-typescript-stdio'],
      \ 'typescript': ['typescript-language-server', '--stdio'],
      \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
      \ 'python': ['pyls'],
      \ 'reason': ['ocaml-language-server', '--stdio'],
      \ 'ocaml': ['ocaml-language-server', '--stdio'],
      \ 'elixir': ['elixir-ls']
      \ }
let g:neosnippet#snippets_directory = "~/dotfiles/snippets"
let g:neosnippet#scope_aliases = {}
let g:deoplete#keyword_patterns = {}
let g:deoplete#sources = {}
let g:gutentags_cache_dir = '~/.tags_cache'
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"===================================WEB=========================================
Plug 'mattn/emmet-vim' "quick HTML expansion
let g:user_emmet_settings = {}
let g:user_emmet_settings['javascript'] =  {'extends': 'jsx'}
let g:user_emmet_settings['javascript.jsx'] =  {'extends': 'jsx'}
let g:user_emmet_settings['typescript'] =  {'extends': 'jsx'}
let g:user_emmet_settings['typescript.tsx'] =  {'extends': 'jsx'}
Plug 'elzr/vim-json' "Better JSON highlighting
let g:vim_json_syntax_conceal=0
"==================================JAVASCRIPT===================================
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0  "Always use jsx syntax
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote
" Use formatprg when available
"let g:neoformat_try_formatprg = 1
"au! BufWritePre *.js Neoformat silent! prettier
"au! BufWritePre *.jsx Neoformat silent! prettier
"==================================TYPESCRIPT===================================
Plug 'leafgarland/typescript-vim', { 'for': [ 'typescript', 'typescript.tsx' ] }
Plug 'HerringtonDarkholme/yats.vim', {'for': ['typescript', 'typescript.tsx']}
Plug 'ianks/vim-tsx', {'for': ['typescript', 'typescript.tsx']}
autocmd FileType typescript setlocal formatprg=prettier\ --stdin\ --parser\ typescript\ --single-quote
autocmd FileType typescript.tsx setlocal formatprg=prettier\ --stdin\ --parser\ typescript\ --single-quote
"au! BufWritePre *.ts Neoformat
"au! BufWritePre *.tsx Neoformat
"=====================================RUBY======================================
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise' "adds end and other endings to methods in Ruby
Plug 'tpope/vim-bundler' "rails bundler
Plug 'tpope/vim-rails'
"==================================ELIXIR=======================================
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
augroup elixir
  au!
  au FileType elixir nn <buffer> <localleader>i :IEx<CR>
  au FileType elixir nn <buffer> <localleader>t :Mix test<CR>
  au FileType elixir nn <buffer> <localleader>x :Mix<Space>
augroup END
autocmd BufWritePost *.exs silent :!mix format %
autocmd BufWritePost *.ex silent :!mix format %
"====================================ETC========================================
"nerdtree
let NERDTreeMapActivateNode='<right>'
let g:NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
"relative numbers in nerdtree
:let g:NERDTreeShowLineNumbers=1
:autocmd BufEnter NERD_* setlocal rnu
"====================================PLUG END========================================
call plug#end()
set background=dark
colorscheme space-vim-dark
" colorscheme onedark
" colorscheme onehalfdark
" colorscheme Tomorrow-Night
let g:airline_theme='simple'
filetype plugin indent on
syntax enable
"===================================FAST SEARCH=================================
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
"===================================AUGROUPS===================================
augroup lsp
  au!
  au FileType python,javascript,javascript.jsx,reason,ocaml,typescript,typescript.tsx setlocal omnifunc=LanguageClient#complete
  au FileType python,javascript,javascript.jsx,reason,ocaml,typescript,typescript.tsx nn <buffer> K :call LanguageClient_textDocument_hover()<cr>
  au FileType python,javascript,javascript.jsx,reason,ocaml,typescript,typescript.tsx nn <buffer> gd :call LanguageClient_textDocument_definition()<cr>
  au FileType python,javascript,javascript.jsx,reason,ocaml,typescript,typescript.tsx nn <buffer> <localleader>f :call LanguageClient_textDocument_formatting()<cr>
  au FileType python,javascript,javascript.jsx,reason,ocaml,typescript,typescript.tsx nn <buffer> <localleader>r :call LanguageClient_textDocument_rename()<cr>
  au FileType python,javascript,javascript.jsx,reason,ocaml,typescript,typescript.tsx nn <buffer> <localleader>u :call LanguageClient_textDocument_documentSymbol()<cr>
augroup ENDn <leader>of :FZF<CR>
"===================================GIT/GITHUB===================================
  nnoremap <leader>ga :Git add -p<CR>i
  nnoremap <leader>gs :Gstatus<CR>
  "flags mean -verbose and -quiet
  nnoremap <leader>gc :Gcommit -v -q<CR>
  nnoremap <leader>gp :Gpush<space>
  nnoremap <leader>gd :Gdiff<CR>
  nnoremap <leader>gf :Git fetch --all --prune<CR>
  "runs the index version, too advanced to use for now
  "nnoremap <leader>ge :Gedit<CR>
  "emptys buffer and reads in the last commit, ie better undo
  nnoremap <leader>gr :Gread<CR>
  "Stage the current file to the index, ie save all changes
  "nnoremap <leader>gw :Gwrite<CR><CR>
  "nnoremap <leader>gp :Ggrep<CR>
  "moves a file and renames the buffer
  nnoremap <leader>gm :Gmove<CR>
  nnoremap <leader>gst :Git stash<CR>
  "delete a file and the buffer
  nnoremap <leader>grm :Gremove<CR>
  nnoremap <leader>gb :Git branch<space>
  nnoremap <leader>gco :Git checkout<space>
  " manually refresh buffer because vim doesnt after a branch switch
  " not a git issue, a vim issue, but I should only use it with git checkout
  " should be done automatically but sometimes doesnt run
  nnoremap <leader>ge :e<CR>
  "==============================KEYBINDINGS=================================
  "jumps to the last buffer,
  nn <leader><leader> :b#<CR>
  " Buffer jumper
  nn [b :bp<CR>
  nn ]b :bn<CR>
  "nn <BACKSPACE> :bp<CR>
  " use fzf to fuzzy find a file in the current project.
  nn <leader>f :Files<CR>
  " use fzf to fizzy find in the current file
  nn <leader>l :Lines<CR>
  " shortcut to help
  nn <leader>h :Helptags<CR>
  " Save files quickly (50% faster than shift+:, w, <CR>!)
  nn <leader>w :w<CR>
  " Quit files quickly (also 50% faster!)
  nn <leader>k :q<CR>
  " close all windows except current
  nn <leader>o :only<CR>
  " Linter bindings, press <leader>l then n/p to navigate
  " between errors or press d to view the detail.
  nn <silent> <leader>ld :ALEDetail<CR>
  nn <silent> <leader>ln :ALENext<CR>
  nn <silent> <leader>lp :ALEPrevious<CR>
  "show where you have been
  nn <leader>m :History<CR>
  "show open buffers
  nn <leader>b :Buffers<CR>
  " new tab
  " Colby uses :tabe but that just opens a blank file not in the current app
  nn <leader>t :tabe%<CR>
  " Make a split quickly, press <leader>s then press a
  " direction (hjkl) to make a split in that direction
  nn <leader>sk :split<CR>
  nn <leader>sj :split<CR><C-W>j
  nn <leader>sh :vsplit<CR>
  nn <leader>sl :vsplit<CR><C-W>l
  " Do a full-text search with ag in the current project.
  nn <leader>/ :Ag<CR>
  " <C-]> is the vim command to look up the docs for the symbol
  " under the cursor, i remap this to g(oto)d(efinition)
  nn gd <C-]>
  " Super fast tab navigation, uppercase HL (which are left
  " and right) will switch left and right between tabs.
  nn H gT
  nn L gt
  " Super fast pane navigation, press ctrl plus the (hjkl)
  " direction of the pane you want to go to.
  nn <C-j> <C-W>j
  nn <C-k> <C-W>k
  nn <C-h> <C-W>h
  nn <C-l> <C-W>l
  "search and replace
  nn <leader>rr :S/
  nn <leader>ra :%S/
  " needed so that vim still understands escape sequences
  " otherwise scrolling creates letters
  nnoremap <esc>^[ <esc>^[
  "elimitates highlighting with esc, it takes a second
  nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
  "nerdtree
  nmap <leader>n :NERDTreeToggle<CR>
  nmap <leader>j :NERDTreeFind<CR>

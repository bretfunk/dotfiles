"===================================SETTINGS========================================
set t_co=256                       "256 colors
set termguicolors                  "true color
set tabstop=2                      "2 spaces for tab
set shiftwidth=2                   "2 spaces for tab
set softtabstop=2                  "2 spaces for tab
set expandtab                      "no tabs
set nowrap                         "no softwrap
set noshowmode                     "don't show insert in echo area
set foldlevel=100                   "folds are stupid
set list                           "show tab characters
set timeoutlen=1000 ttimeoutlen=-1 "better timeouts
set number                         "line numbers
set relativenumber                 "line numbers
set mouse=                        "dont use the mouse
set smartindent
set smartcase                        "search is case insensitive until you add a capital letter
set foldmethod=syntax              "code folding
set textwidth=80                   "format at 80 lines
set ls=2                           "better status line
" set clipboard=unnamedplus              "use system clipboard
" set clipboard=unnamed               "copy to clipboard
set hidden                         "allow jumping back and forth between multiple unsaved buffers
set noshowmode                     "because airline...
set visualbell                     "no sounds!
set ignorecase                     "ignore case when searching
set smartcase                      "don't ignore when I specify
set wildignorecase                 "case insensitive file search
set backup                         "backups
set noswapfile
set backupdir=~/.config/nvim/backup
set diffopt=vertical               "vertical diff splits
set updatetime=2000                "a bit faster updatetime
set shortmess+=c                   "make that mess shorter?
:let mapleader = ' '               "leader is space
:let maplocalleader = ','          "localleader is comma
set incsearch                      " Find the next match as we type the search
set hlsearch                       " Highlight searches by default
set autoread                        "auto loads changed file, like when changing branches
se mouse+=a                       "mouse doesn't copy line numbers
"===================================FUNCTIONS===================================
func! StripTrailingWhitespace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunc

func! OpenOrCreateTerminal()
  let term = bufname('term://')
  if bufexists(term)
    :buffer term
  else
    :terminal
  endif
endfunc

" Conditionally load vim plugins.
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, {'on': [], 'for': [] })
endfunction

" coc tab completion
function! Check_back_space() abort
  let col = col('.') - 1
  echom(col)
  echom(getline('.')[col - 1])
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
"
" coc tab completion
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ Check_back_space() ? "\<TAB>" :
  \ coc#refresh()
"==================================PLUGINS===================================
call plug#begin('~/.vim/plugged')
"==================================COSMETIC===============================
Plug 'rainglow/vim'
"rainglow recommended settings
set linespace=3
set guifont=Fira\ Code:h12
set cursorline
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
" makes gutter (SignColumn) the same color as the background
augroup myColors
    autocmd!
    autocmd ColorScheme * highlight SignColumn guibg=ColorColumn
augroup END
"==================================UTILITY===============================
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"==================================NAVIGATION===================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ggreer/the_silver_searcher'
"==================================AUTOCOMPLETION===============================
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-svelte',
  \ 'coc-emmet',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-markdownlint',
  \ 'coc-tsserver',
  \ 'coc-tailwindcss',
  \ 'coc-elixir'
  \ ]
"===================================WEB=========================================
Plug 'mattn/emmet-vim'
let g:user_emmet_settings = {
\  'javascript' : {'extends' : 'jsx'},
\  'javascript.jsx' : {'extends' : 'jsx'},
\  'typescript' : {'extends' : 'jsx'},
\  'typescript.tsx' : {'extends' : 'jsx'},
\}
Plug 'elzr/vim-json' "Better JSON highlighting
"==================================HTML/CSS===================================
Plug 'turbio/bracey.vim' "vscode liveserver for vim
"==================================MARKDOWN===================================
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } "Markdownpreview
" turn on spellcheck automatically for markdown files
:autocmd BufRead,BufNewFile *.md setlocal spell
"==================================JAVASCRIPT===================================
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
let g:jsx_ext_required = 0  "Always use jsx syntax
let g:vue_disable_pre_processors=1

"==================================TYPESCRIPT===================================
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
au! FileType typescript set foldmethod=indent
au! FileType typescript.tsx set foldmethod=indent

"==================================SVELTE===================================
Plug 'leafOfTree/vim-svelte-plugin'
au! BufNewFile,BufRead *.svelte set ft=html
"==================================ELIXIR=======================================
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'
au BufEnter *.leex set filetype=eelixir
let g:mix_format_on_save = 1
"====================================ETC========================================
Plug 'mbbill/undotree'
"netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
"for crud-ing files
Plug 'tpope/vim-eunuch'
"relative numbers in netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
"====================================FUN========================================
Plug 'ThePrimeagen/vim-be-good'
"====================================PLUG END========================================
call plug#end()
set background=dark
colorscheme Downpour
filetype plugin indent on
syntax on
"===================================FAST SEARCH=================================
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
  "==============================KEYBINDINGS=================================
  nn <leader>f :Files<CR>
  nmap <silent> <leader>ld <Plug>(coc-diagnostic-info)
  nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
  nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
  " Do a full-text search with ag in the current project.
  nn <leader>/ :Ag<CR>
  " <C-]> is the vim command to look up the docs for the symbol
  " under the cursor, i remap this to g(oto)d(efinition)
  nn gd <C-]>
  " Super fast pane navigation, press ctrl plus the (hjkl)
  " direction of the pane you want to go to.
  nn <C-j> <C-W>j
  nn <C-k> <C-W>k
  nn <C-h> <C-W>h
  nn <C-l> <C-W>l
  "elimitates highlighting with esc, it takes a second
  nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
  nnoremap <leader>u :UndotreeShow<CR>


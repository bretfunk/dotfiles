
" ███████╗██╗   ██╗███╗   ██╗██╗  ██╗███████╗    ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██╔════╝██║   ██║████╗  ██║██║ ██╔╝██╔════╝    ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" █████╗  ██║   ██║██╔██╗ ██║█████╔╝ ███████╗    ██║   ██║██║██╔████╔██║██████╔╝██║
" ██╔══╝  ██║   ██║██║╚██╗██║██╔═██╗ ╚════██║    ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
" ██║     ╚██████╔╝██║ ╚████║██║  ██╗███████║     ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
" ╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

" "Just as a Jedi must build their own lightsaber, you must build your own vimrc" - Mike Dao
"==================================SETTINGS=========================================
let mapleader = ' '                      "leader is space
set t_co=256                             "256 colors
set termguicolors                        "true color
set signcolumn=number                    "make gutter just the numbers, requires nvim 0.5
set expandtab                            "no tabs
set tabstop=2                            "2 spaces for tab
set shiftwidth=2                         "2 spaces for tab
set softtabstop=2                        "2 spaces for tab
set list                                 "show tab characters
set nowrap                               "no softwrap
set nofoldenable                         "no code folding
set number                               "line numbers
set relativenumber                       "relative line numbers
set smartindent                          "smart indent
set hidden                               "allow jumping back and forth between multiple unsaved buffers
set visualbell                           "no sounds!
set ignorecase                           "search is not case sensitive
set smartcase                            "search is case insensitive until you add a capital letter
set incsearch                            " Find the next match as we type the search
set autoread                             "auto loads changed file, like when changing branches
set backup                               "backups
set noswapfile
set backupdir=~/.config/nvim/backup
"==================================FUNCTIONS=======================================
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

" Conditionally load vim plugins
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

" coc tab completion
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ Check_back_space() ? "\<TAB>" :
  \ coc#refresh()
"==================================PLUGINS=========================================
call plug#begin('~/.vim/plugged')
"==================================COSMETIC========================================
Plug 'rainglow/vim'
"rainglow recommended settings
set linespace=3
set guifont=Fira\ Code:h12
set cursorline
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
"==================================UTILITY=========================================
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' "netrw line numbers
Plug 'mbbill/undotree'
"==================================NAVIGATION======================================
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"respect gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
Plug 'ggreer/the_silver_searcher'
"==================================AUTOCOMPLETION==================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
let g:coc_global_extensions = [
  \ 'coc-elixir', 'coc-erlang_ls', 'coc-svelte', 'coc-css', 'coc-tailwindcss',
  \ 'coc-tsserver', 'coc-eslint', 'coc-html', 'coc-prettier', 'coc-snippets',
  \ ]
"===================================VIM============================================
Plug 'ThePrimeagen/vim-be-good'
"===================================WEB============================================
Plug 'mattn/emmet-vim'
Plug 'elzr/vim-json' "Better JSON highlighting
"==================================HTML/CSS========================================
Plug 'turbio/bracey.vim' "vscode liveserver for vim
"==================================WRITING=========================================
Plug 'vimwiki/vimwiki'
"vimwiki settings
set nocompatible
filetype plugin on
syntax on
"vimwiki uses markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
:autocmd BufRead,BufNewFile *.md setlocal spell "auto markdown spellcheck
"==================================JAVASCRIPT======================================
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
" Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
let g:jsx_ext_required = 0  "Always use jsx syntax
"==================================TYPESCRIPT======================================
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
au! FileType typescript set foldmethod=indent
au! FileType typescript.tsx set foldmethod=indent
"==================================SVELTE==========================================
Plug 'leafOfTree/vim-svelte-plugin'
au! BufNewFile,BufRead *.svelte set ft=html
"==================================ELIXIR==========================================
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'
au BufEnter *.leex set filetype=eelixir
let g:mix_format_on_save = 1
"==================================PLUG END========================================
call plug#end()
colorscheme Downpour
set background=dark
"==================================FAST SEARCH=====================================
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
"==================================KEYBINDINGS=====================================
"fzf
nn <leader>f :Files<CR>
"coc
nmap <silent> <leader>ld <Plug>(coc-diagnostic-info)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Do a full-text search with ag in the current project
nn <leader>/ :Ag<CR>
"better split movements
nn <C-j> <C-W>j
nn <C-k> <C-W>k
nn <C-h> <C-W>h
nn <C-l> <C-W>l
"undo tree
nnoremap <leader>u :UndotreeShow<CR>
"vim fugitive merge left
nmap<leader>ml :diffget //2<CR>
"vim fugitive merge right
nmap<leader>mr :diffget //3<CR>
"TODO add rename

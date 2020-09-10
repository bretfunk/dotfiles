
" ███████╗██╗   ██╗███╗   ██╗██╗  ██╗███████╗    ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██╔════╝██║   ██║████╗  ██║██║ ██╔╝██╔════╝    ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" █████╗  ██║   ██║██╔██╗ ██║█████╔╝ ███████╗    ██║   ██║██║██╔████╔██║██████╔╝██║
" ██╔══╝  ██║   ██║██║╚██╗██║██╔═██╗ ╚════██║    ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
" ██║     ╚██████╔╝██║ ╚████║██║  ██╗███████║     ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
" ╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

" "Just as a Jedi must build their own lightsaber, you must build your own vimrc" - Mike Dao
"==================================SETTINGS=========================================
  let mapleader = ' '                    "leader is space
set t_co=256                             "256 colors
set termguicolors                        "true color
set expandtab                            "no tabs
set tabstop=2                            "2 spaces for tab
set shiftwidth=2                         "2 spaces for tab
set softtabstop=2                        "2 spaces for tab
set list                                 "show tab characters
set nowrap                               "no softwrap
set nofoldenable                         "no code folding
set number                               "line numbers
set relativenumber                       "relative line numbers
set mouse=                               "dont use the mouse
set smartindent                          "smart indent
set hidden                               "allow jumping back and forth between multiple unsaved buffers
set visualbell                           "no sounds!
set ignorecase                           "search is not case sensitive
set smartcase                            "search is case insensitive until you add a capital letter
set wildignorecase                       "case insensitive file search
set incsearch                            " Find the next match as we type the search
set autoread                             "auto loads changed file, like when changing branches
set clipboard=unnamed                    "copy to clipboard
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
" makes gutter (SignColumn) the same color as the background
augroup myColors
    autocmd!
    autocmd ColorScheme * highlight SignColumn guibg=ColorColumn
augroup END
"==================================UTILITY=========================================
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' "netrw line numbers
Plug 'mbbill/undotree'
"==================================NAVIGATION======================================
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ggreer/the_silver_searcher'
"==================================AUTOCOMPLETION==================================
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
"===================================WEB============================================
Plug 'mattn/emmet-vim'
Plug 'elzr/vim-json' "Better JSON highlighting
"==================================HTML/CSS========================================
Plug 'turbio/bracey.vim' "vscode liveserver for vim
"==================================WRITING=========================================
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
:autocmd BufRead,BufNewFile *.md setlocal spell "auto markdown spellcheck
"vimwiki uses markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
"==================================JAVASCRIPT======================================
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
let g:jsx_ext_required = 0  "Always use jsx syntax
let g:vue_disable_pre_processors=1
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

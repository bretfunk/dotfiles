
" ███████╗██╗   ██╗███╗   ██╗██╗  ██╗███████╗    ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██╔════╝██║   ██║████╗  ██║██║ ██╔╝██╔════╝    ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" █████╗  ██║   ██║██╔██╗ ██║█████╔╝ ███████╗    ██║   ██║██║██╔████╔██║██████╔╝██║
" ██╔══╝  ██║   ██║██║╚██╗██║██╔═██╗ ╚════██║    ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
" ██║     ╚██████╔╝██║ ╚████║██║  ██╗███████║     ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
" ╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

" "Just as a Jedi must build their own lightsaber, you must build your own vimrc" - Mike Dao
"==================================SETTINGS=========================================
let mapleader = ' '                      "leader is space
" coc.nvim config suggestions
set hidden                               "allow jumping back and forth between multiple unsaved buffers
set nowritebackup
set updatetime=250                       "longer leads to delays
set shortmess+=c                         "Dont pass messages to ins-completion-menu
set t_co=256                             "256 colors
set termguicolors                        "true color
set signcolumn=number                    "make gutter just the numbers, requires nvim 0.5
set expandtab                            "no tabs
set tabstop=2                            "2 spaces for tab
set shiftwidth=2                         "2 spaces for tab
set softtabstop=2                        "2 spaces for tab
set list                                 "show tab characters
set nowrap                               "no softwrap
set foldmethod=manual
" set foldmethod=syntax
set nofoldenable                         "no code folding
set number                               "line numbers
set relativenumber                       "relative line numbers
set smartindent                          "smart indent
set visualbell                           "no sounds!
set ignorecase                           "search is not case sensitive
set smartcase                            "search is case insensitive until you add a capital letter
set incsearch                            " Find the next match as we type the search
set autoread                             "auto loads changed file, like when changing branches
set shellcmdflag=-ic                     "use bash aliases in command mode
set diffopt+=vertical                    "git diff is vertical
set noswapfile
set backupdir=~/.config/nvim/backup
"==================================PLUGINS=========================================
call plug#begin('~/.vim/plugged')
"==================================NEOVIM==========================================
let g:python3_host_prog  = '/usr/bin/python3'
"==================================COSMETIC========================================
Plug 'mhartington/oceanic-next'
let g:airline_theme='simple'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
"==================================UTILITY=========================================
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' "netrw line numbers
Plug 'mbbill/undotree'
"==================================NAVIGATION======================================
"fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" sorting
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"==================================AUTOCOMPLETION==================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
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
" need for vim-elixir syntax also
filetype plugin indent on
syntax on
" vimwiki uses markdown
 let g:vimwiki_list = [{'path': '~/vimwiki/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]
 Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
 :autocmd BufRead,BufNewFile *.md setlocal spell "auto markdown spellcheck
"==================================RUST============================================
" Plug 'rust-lang/rust.vim'
"==================================HASKELL=========================================
"haskell coc configed in coc file
" Plug 'haskell/haskell-language-server'
" Plug 'neovimhaskell/haskell-vim'
" Plug 'alx741/vim-hindent'
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
"==================================SOLIDITY=========================================
" Plug 'TovarishFin/vim-solidity'
"==================================PYTHON==========================================
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': ['python']}
" Plug 'Vimjas/vim-python-pep8-indent'
" with open(activate_this) as f:
"    code = compile(f.read(), activate_this, 'exec')
"    exec(code, dict(__file__=activate_this))
"==================================SVELTE==========================================
" Plug 'leafOfTree/vim-svelte-plugin'
" au! BufNewFile,BufRead *.svelte set ft=html
"==================================ELIXIR==========================================
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-endwise',    { 'for': ['elixir'] }
Plug 'mhinz/vim-mix-format'
au BufEnter *.leex set filetype=eelixir
au BufEnter *.heex set filetype=eelixir
au BufEnter *.ex set filetype=elixir
let g:mix_format_on_save = 1
"==================================PLUG END========================================
call plug#end()
set background=dark
if (has("termguicolors"))
 set termguicolors
endif
colorscheme OceanicNext

"reload vimrc
nmap <leader>rv :source ~/dotfiles/vimrc<cr>

"delete all buffers
nmap <leader>db :buffdo bdelete<cr>

"telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"coc
nmap <silent> <leader>ld <Plug>(coc-diagnostic-info)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)

nmap <leader>rn :CocCommand document.renameCurrentWord<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>p  :<C-u>CocListResume<CR>

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
"vim fugitive update buffer
nmap<leader>mu :diffupdate<CR>

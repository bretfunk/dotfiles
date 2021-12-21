
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
" set nobackup                             "some servers have issues with backup files
set nowritebackup
" set cmdheight=2                          "give more space for display messages
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
" set nofoldenable                         "no code folding
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
" set directory=~/.config/nvim/tmp
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
"==================================NEOVIM==========================================
let g:python3_host_prog  = '/usr/bin/python3'
"==================================COSMETIC========================================
" Plug 'rainglow/vim'
" Plug 'mhartington/oceanic-next'
" rainglow recommended settings
 " set linespace=3
 " set guifont=Fira\ Code:h12
 " set cursorline
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
" Plug 'gruvbox-community/gruvbox'
"==================================UTILITY=========================================
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' "netrw line numbers
Plug 'mbbill/undotree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"==================================NAVIGATION======================================
"fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" sorting
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" need to have a parser for each language
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
"==================================RUST============================================
Plug 'rust-lang/rust.vim'
"==================================HASKELL============================================
"haskell coc configed in coc file
Plug 'haskell/haskell-language-server'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
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
Plug 'TovarishFin/vim-solidity'
"==================================PYTHON==========================================
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': ['python']}
" Plug 'Vimjas/vim-python-pep8-indent'
" with open(activate_this) as f:
"    code = compile(f.read(), activate_this, 'exec')
"    exec(code, dict(__file__=activate_this))
"==================================SVELTE==========================================
Plug 'leafOfTree/vim-svelte-plugin'
au! BufNewFile,BufRead *.svelte set ft=html
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
" colorscheme Boxuk
set background=dark
if (has("termguicolors"))
 set termguicolors
endif
" colorscheme OceanicNext
" colorscheme freshcut
"==================================FAST SEARCH=====================================
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
"==================================KEYBINDINGS=====================================
"reload vimrc
nmap <leader>vr :source ~/dotfiles/vimrc<cr>

"delete all buffers
nmap <leader>db :buffdo bdelete<cr>

"telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
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
"vim fugitive update buffer
nmap<leader>mu :diffupdate<CR>

"esc removes last highlight
nnoremap <esc> :noh<return><esc>
"==================================CUSTOM=====================================
"formats html in a non html file
function! Format()
  :set ft=html
  :execute search("<html>") . "mark <" | execute search("</html>") . "mark >" | normal gv=
  :set ft=elixir
endfunction

"==================================SNIPPETS=====================================
"" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-n> for jump to next placeholder, <C-j> is default for coc.nvim
let g:coc_snippet_next = '<c-n>'

" Use <C-p> for jump to previous placeholder, <C-k> is default for coc.nvim
let g:coc_snippet_prev = '<c-p>'

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


"==================================LUA=====================================
lua <<EOF
EOF

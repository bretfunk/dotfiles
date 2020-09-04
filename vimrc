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
" set cindent                        "auto indent
set smartindent
set smartcase                        "search is case insensitive until you add a capital letter
set foldmethod=syntax              "code folding
set textwidth=80                   "format at 80 lines
set ls=2                           "better status line
" set clipboard=unnamedplus              "use system clipboard
set hidden                         "allow jumping back and forth between multiple unsaved buffers
set noshowmode                     "because airline...
set visualbell                     "no sounds!
set ignorecase                     "ignore case when searching
set smartcase                      "don't ignore when I specify
set wildignorecase                 "case insensitive file search
" set colorcolumn=80                  "color line at 80
" set inccommand=nosplit             "show replaces while typing
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
" set clipboard=unnamed               "copy to clipboard
se mouse+=a                       "mouse doesn't copy line numbers
"===================================IGNORE======================================
" set wildignore+=*/_build
" set wildignore+=*/.cljs_rhino_repl
" set wildignore+=*.pyc
" set wildignore+=*/node_modules/*
" set wildignore+=*/bower_components/*
" set wildignore+=.git
" set wildignore+=.venv
" set wildignore+=*/dist
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

" " override $VISUAL to use nvr inside neovim
" if executable('nvr')
"   let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
" endif
"
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
" Plug 'vim-airline/vim-airline-themes'
"it is concealing the double quotes in json files and driving me crazy
" Plug 'Yggdroot/indentLine'
" let g:rainbow_active = 1
"airline
" let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
"==================================UTILITY===============================
" Plug 'scrooloose/nerdtree'
" delimitMate doesn't play nice with vim hardmode so commenting out for now
" Plug 'Raimondi/delimitMate'
" let delimitMate_expand_cr=1
" let delimitMate_jump_expansion=1
" let delimitMate_balance_matchpairs=1
" Plug 'justinmk/vim-sneak'
" let g:sneak#use_ic_scs = 1
" let g:sneak#map_netrw = 0
" let g:sneak#label = 1
Plug 'tpope/vim-commentary'
" let NERDSpaceDelims=1
"fugitive is for git commands
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-rhubarb'
" Plug 'tpope/vim-repeat'
"==================================NAVIGATION===================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ggreer/the_silver_searcher'
" Plug 'wikitopian/hardmode'
" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
" enable hardmode by default
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
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
" Plug 'evanleck/vim-svelte'
au! BufNewFile,BufRead *.svelte set ft=html
"==================================ELIXIR=======================================
" Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'
" Plug 'slime-lang/vim-slime-syntax'
au BufEnter *.leex set filetype=eelixir
let g:mix_format_on_save = 1
" au! BufNewFile,BufRead *.slimleex set filetype=slime
" au! BufNewFile,BufRead *.slim set filetype=slime
"===================================RUBY========================================
" Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
" Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
"==================================PYTHON=======================================
" au! FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
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
"better netrw
" Plug 'tpope/vim-vinegar'
"nerdtree
" let NERDTreeMapActivateNode='<right>'
" let g:NERDTreeQuitOnOpen = 1
" let NERDTreeShowHidden=1
" let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
"relative numbers in nerdtree
" :let g:NERDTreeShowLineNumbers=1
" :autocmd BufEnter NERD_* setlocal rnu
" open nerdtree in current dir
" autocmd BufEnter * lcd %:p:h
"====================================FUN========================================
Plug 'ThePrimeagen/vim-be-good'
"====================================PLUG END========================================
call plug#end()
set background=dark
" colorscheme Codecourse
colorscheme Downpour
" let g:airline_theme='simple'
filetype plugin indent on
syntax enable
" prob a duplicate of the above but required by vim-elixir
syntax on
"===================================FAST SEARCH=================================
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
"===================================LSP Bindings===================================
" augroup lsp
"   au!
"   au FileType terraform,cs,vue,json,elixir,eelixir,reason,ocaml,rust,python,javacript,javascript.jsx,typescript,typescript.tsx,svelte nn <silent> <buffer> K :call CocAction("doHover")<CR>
"   au FileType terraform,cs,vue,json,elixir,eelixir,reason,ocaml,rust,python,javacript,javascript.jsx,typescript,typescript.ts,svelte  nn <silent> <buffer> gd :call CocAction("jumpDefinition")<CR>
"   au FileType terraform,cs,vue,json,elixir,eelixir,reason,ocaml,rust,python,javacript,javascript.jsx,typescript,typescript.ts,svelte  nn <silent> <buffer> gr :call CocAction("jumpReferences")<CR>
"   au FileType terraform,cs,vue,json,elixir,eelixir,reason,ocaml,rust,python,javacript,javascript.jsx,typescript,typescript.ts,svelte  nn <buffer> <localleader>i :call CocAction("workspaceSymbols")<CR>
"   au FileType terraform,cs,vue,json,elixir,eelixir,reason,ocaml,rust,python,javacript,javascript.jsx,typescript,typescript.ts,svelte  nn <buffer> <localleader>r :call CocAction("rename")<CR>
"   au CursorHoldI,CursorMovedI * call CocActionAsync('showSignatureHelp')
" augroup END
"===================================GIT/GITHUB===================================
  "nnoremap <leader>ga :Git add -p<CR>i
  "nnoremap <leader>gs :Gstatus<CR>
  ""flags mean -verbose and -quiet
  "nnoremap <leader>gc :Gcommit -v -q<CR>
  "nnoremap <leader>gp :Gpush<space>
  "nnoremap <leader>gd :Gdiff<CR>
  "nnoremap <leader>gf :Git fetch --all --prune<CR>
  "runs the index version, too advanced to use for now
  "nnoremap <leader>ge :Gedit<CR>
  "emptys buffer and reads in the last commit, ie better undo
  " nnoremap <leader>gr :Gread<CR>
  "Stage the current file to the index, ie save all changes
  "nnoremap <leader>gw :Gwrite<CR><CR>
  "nnoremap <leader>gp :Ggrep<CR>
  "moves a file and renames the buffer
  " nnoremap <leader>gm :Gmove<CR>
  " nnoremap <leader>gst :Git stash<CR>
  ""delete a file and the buffer
  "nnoremap <leader>grm :Gremove<CR>
  "nnoremap <leader>gb :Git branch<space>
  "nnoremap <leader>gco :Git checkout<space>
  " manually refresh buffer because vim doesnt after a branch switch
  " not a git issue, a vim issue, but I should only use it with git checkout
  " should be done automatically but sometimes doesnt run
  " nnoremap <leader>ge :e<CR>
  "==============================KEYBINDINGS=================================
  "jumps to the last buffer,
  " nn <leader><leader> :b#<CR>
  " Buffer jumper
  " nn [b :bp<CR>
  " nn ]b :bn<CR>
  "nn <BACKSPACE> :bp<CR>
  " use fzf to fuzzy find a file in the current project.
  nn <leader>f :Files<CR>
  " linter next,prev,info
  nmap <silent> <leader>ld <Plug>(coc-diagnostic-info)
  nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
  nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)

  " shortcut to help
  " nn <leader>h :Helptags<CR>
  " Save files quickly (50% faster than shift+:, w, <CR>!)
  " nn <leader>w :w<CR>
  " Quit files quickly (also 50% faster!)
  " nn <leader>k :q<CR>
  " close all windows except current
  " nn <leader>o :only<CR>
  "show where you have been
  " nn <leader>m :History<CR>
  "show open buffers
  " nn <leader>b :Buffers<CR>
  "fix misspelled word
  " nn <leader>r 1z=
  " new tab
  " Colby uses :tabe but that just opens a blank file not in the current app
  " nn <leader>t :tabe%<CR>
  " Make a split quickly, press <leader>s then press a
  " direction (hjkl) to make a split in that direction
  " nn <leader>sk :split<CR>
  " nn <leader>sj :split<CR><C-W>j
  " nn <leader>sh :vsplit<CR>
  " nn <leader>sl :vsplit<CR><C-W>l
  " Do a full-text search with ag in the current project.
  nn <leader>/ :Ag<CR>
  " <C-]> is the vim command to look up the docs for the symbol
  " under the cursor, i remap this to g(oto)d(efinition)
  nn gd <C-]>
  " Super fast tab navigation, uppercase HL (which are left
  " and right) will switch left and right between tabs.
  " nn H gT
  " nn L gt
  " Super fast pane navigation, press ctrl plus the (hjkl)
  " direction of the pane you want to go to.
  nn <C-j> <C-W>j
  nn <C-k> <C-W>k
  nn <C-h> <C-W>h
  nn <C-l> <C-W>l
  "search and replace
  " nn <leader>rr :S/
  " nn <leader>ra :%S/
  " needed so that vim still understands escape sequences
  " otherwise scrolling creates letters
  " nnoremap <esc>^[ <esc>^[
  "elimitates highlighting with esc, it takes a second
  nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
  "nerdtree
  " nmap <leader>n :NERDTreeToggle<CR>
  nnoremap <leader>u :UndotreeShow<CR>


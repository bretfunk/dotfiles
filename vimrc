
" ███████╗██╗   ██╗███╗   ██╗██╗  ██╗███████╗    ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██╔════╝██║   ██║████╗  ██║██║ ██╔╝██╔════╝    ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" █████╗  ██║   ██║██╔██╗ ██║█████╔╝ ███████╗    ██║   ██║██║██╔████╔██║██████╔╝██║
" ██╔══╝  ██║   ██║██║╚██╗██║██╔═██╗ ╚════██║    ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
" ██║     ╚██████╔╝██║ ╚████║██║  ██╗███████║     ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
" ╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

" "Just as a Jedi must build their own lightsaber, you must build your own vimrc" - Mike Dao
"==================================SETTINGS=========================================
"# TODO
"# packer plugin manager
"# Lua vimrc
"https://elixirforum.com/t/neovim-elixir-setup-configuration-from-scratch-guide/46310
let mapleader = ' '                      "leader is space
" coc.nvim config suggestions
set hidden                               "allow jumping back and forth between multiple unsaved buffers
set nowritebackup
set updatetime=250                       "longer leads to delays
set shortmess+=c                         "Dont pass messages to ins-completion-menu
set t_co=256                             "256 colors
set termguicolors                        "true color
  set signcolumn=auto                    "make gutter just numbers until error
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
" set relativenumber                       "relative line numbers
set smartindent                          "smart indent
set visualbell                           "no sounds!
set ignorecase                           "search is not case sensitive
set smartcase                            "search is case insensitive until you add a capital letter
set incsearch                            " Find the next match as we type the search
set autoread                             "auto loads changed file, like when changing branches
set shellcmdflag=-ic                     "use bash aliases in command mode
set cmdheight=2                          "more room for errors so dont have to type enter to continue
set diffopt+=vertical                    "git diff is vertical
set noswapfile
set backupdir=~/.config/nvim/backup
"==================================PLUGINS=========================================
call plug#begin('~/.vim/plugged')
"==================================NEOVIM==========================================
" if you update the python version you will need to update this
let g:python3_host_prog = '/Users/bretfunk/.pyenv/versions/3.10.4/bin/python3'
"==================================COSMETIC========================================
" Plug 'mhartington/oceanic-next'
Plug 'crusoexia/vim-monokai'
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
" errors
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

"==================================NAVIGATION======================================
"fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" sorting
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"==================================AUTOCOMPLETION==================================
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
"===================================WEB============================================
" Plug 'mattn/emmet-vim'
" Plug 'elzr/vim-json' "Better JSON highlighting
"==================================HTML/CSS========================================
" Plug 'turbio/bracey.vim' "vscode liveserver for vim
"==================================WRITING=========================================
"Plug 'vimwiki/vimwiki'
""vimwiki settings
"set nocompatible
"filetype plugin on
"" need for vim-elixir syntax also
"filetype plugin indent on
"syntax on
"" vimwiki uses markdown
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" :autocmd BufRead,BufNewFile *.md setlocal spell "auto markdown spellcheck
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
" Plug 'numirias/semshi'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neovim/python-client'
" this has issues
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'davidhalter/jedi'
" Plug 'tell-k/vim-autopep8'

" with open(activate_this) as f:
"    code = compile(f.read(), activate_this, 'exec')
"    exec(code, dict(__file__=activate_this))
"==================================SVELTE==========================================
" Plug 'leafOfTree/vim-svelte-plugin'
" au! BufNewFile,BufRead *.svelte set ft=html
"==================================ELIXIR==========================================
" Plug 'elixir-editors/vim-elixir'
" Plug 'tpope/vim-endwise',    { 'for': ['elixir'] }
" Plug 'mhinz/vim-mix-format'
" au BufEnter *.leex set filetype=eelixir
" au BufEnter *.heex set filetype=eelixir
" au BufEnter *.ex set filetype=elixir
" let g:mix_format_on_save = 1
"==================================PLUG END========================================
call plug#end()
set background=dark
if (has("termguicolors"))
 set termguicolors
endif
" colorscheme OceanicNext
colorscheme monokai

"reload vimrc
nmap <leader>rv :source ~/dotfiles/vimrc<cr>

"delete all buffers
" nmap <leader>db :buffdo bdelete<cr>
" close all but current buffer
command! BufOnly silent! execute "%bd|e#|bd#"
nnoremap <leader>bd :BufOnly<cr>

"telescope
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"coc
" nmap <silent> <leader>ld <Plug>(coc-diagnostic-info)
" nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
" nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)

" nmap <leader>rn :CocCommand document.renameCurrentWord<cr>

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gt <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <leader>p  :<C-u>CocListResume<CR>

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

"cycle though buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
"==================================LUA==========================================
lua << EOF
require('telescope').setup{
    defaults = {
        color_devicons = false,
        layout_config = {
            width = 0.7,
            horizontal = {
                preview_width = 0.6
            }
        }
    },
    pickers = {
        buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
        },
  },
}
-- LSP
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- NVIM_CMP
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  -- python
  require'lspconfig'.pyright.setup{}
  -- elixir
  -- Configure ElixirLS as the LSP server for Elixir.
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
require'lspconfig'.elixirls.setup{
  cmd = { "/Users/bretfunk/.elixir-ls/release/language_server.sh" },
  -- cmd = { "~/.elixir-ls/release/language_server.sh" },
  -- on_attach = custom_attach, -- this may be required for extended functionalities of the LSP
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  elixirLS = {
    dialyzerEnabled = false,
    fetchDeps = false,
  };
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

-- TREE SITTER

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- TROUBLE
require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

-- DEVICONS
require'nvim-web-devicons'.get_icons()
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

EOF

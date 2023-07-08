:set number relativenumber    " show line number
:set autoindent               " auto indent when enter
:set tabstop=2                " length of a \t
:set shiftwidth=2             " width of code indent
:set smarttab                 " use tab charater base on previous indent charater
:set expandtab                " indent with space
:set mouse=a                  " enable mouse
:set mousescroll=ver:1,hor:4
" :set clipboard+=unnamedplus   " register use clipboard
:set listchars=tab:‣─,trail:~,extends:›,precedes:‹ " space:·
:set list                     " show hidden chars
:set nowrap                   " Don't wrap line, see shortcut to toggle wrap below
:set updatetime=300           " For faster git gutter refresh
:set ignorecase               " ignore case during search
:set splitright               " vsplit new window to the right of current one
:set splitbelow               " split new window below current one
:set title                    " set terminal title
:set colorcolumn=+1           " show column limit when textwidth is defined
:set scl=yes                  " always show signcolumn to avoid text shifting
:set fixeol                   " always add trailing new line at the end of file

let mapleader = "," " map leader to comma

call plug#begin()

"""" UI enhancement
Plug 'nvim-tree/nvim-web-devicons'     " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'         " NvimTree plugin
Plug 'nvim-lualine/lualine.nvim'       " Status bar
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' } " Bufferline (tab-like bar for buffers)
Plug 'airblade/vim-gitgutter'          " Git gutter
Plug 'tpope/vim-fugitive'              " Git inside vim
Plug 'f-person/git-blame.nvim'         " Git blame status
Plug 'petertriho/nvim-scrollbar'       " Scroll bar with gutter highlight
" Plug 'tc50cal/vim-terminal'          " Vim Terminal
" Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'sainnhe/sonokai'                 " Sonokai colorscheme
Plug 'mhartington/oceanic-next'        " Oceanic Next scheme
Plug 'joshdick/onedark.vim'            " OneDark color scheme
Plug 'github/copilot.vim'              " github copilot

"""" Motion and shortcuts
Plug 'tpope/vim-surround'                  " Surrounding cs'` ysw)
Plug 'matze/vim-move'                      " Move text <S-hjkl>
Plug 'lukas-reineke/indent-blankline.nvim' " Show indent guide
Plug 'numToStr/Comment.nvim'               " Commenting code with gcc & gbc
Plug 'mg979/vim-visual-multi'              " Multiple cursor
Plug 'nvim-lua/plenary.nvim'               " telescope prerequisite
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' } " Pick files or command (similar to cmd-P in ST3)
Plug 'dyng/ctrlsf.vim'                     " Find in files similar to ctrl-shift-f in ST3
Plug 'terryma/vim-expand-region'           " Expand selection

"""" Language enhancement
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Improved language support
" Plug 'nvim-treesitter/nvim-tree-docs'               " Doc comments powered by treesitter (to fix gd lag due to: gdd)
" Modern LSP completion replacing CoC
Plug 'neovim/nvim-lspconfig'               " LSP configuration
Plug 'hrsh7th/cmp-nvim-lsp'                " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'                  " buffer source for cmp
Plug 'hrsh7th/cmp-path'                    " Path source for cmp
Plug 'hrsh7th/cmp-cmdline'                 " Command line source for cmp
Plug 'hrsh7th/cmp-nvim-lsp-signature-help' " signature helper source
Plug 'hrsh7th/nvim-cmp'                    " The Autocompletion engine
" For luasnip users.
Plug 'rafamadriz/friendly-snippets'        " Snippets collection
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*', 'do': 'make install_jsregexp'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'gpanders/editorconfig.nvim'                   " Better Editorconfig with custom properties
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'godlygeek/tabular'                            " :Tabularize \,
Plug 'JoosepAlviste/nvim-ts-context-commentstring'  " Contextual commentstring
Plug 'windwp/nvim-ts-autotag'                       " Auto close tag with treesitter
Plug 'windwp/nvim-autopairs'                        " Auto close brackets and quotes
Plug 'preservim/vim-markdown'                       " Better markdown support
Plug 'norcalli/nvim-colorizer.lua'                  " Color code highlighter
Plug 'mustache/vim-mustache-handlebars'
Plug 'mattn/emmet-vim'                              " Emmet
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }  " :MarkdownPreview
Plug 'edluffy/hologram.nvim'                        " View image in neovim with Kitty Graphics Protocol

set encoding=utf-8

call plug#end()

" :colorscheme onedark
" :colorscheme sonokai
:colorscheme OceanicNext
:set termguicolors

" map command shift-Q to qa, and support ! bang
:command-bang Q qa<bang>

" Ctrl-Shift-F find in files
nmap     <C-S-f> <Plug>CtrlSFPrompt
"vmap     <C-f>f <Plug>CtrlSFVwordPath
"vmap     <C-f>F <Plug>CtrlSFVwordExec
"nmap     <C-f>n <Plug>CtrlSFCwordPath
"nmap     <C-f>p <Plug>CtrlSFPwordPath
nnoremap <leader>fo :CtrlSFOpen<CR>
nnoremap <leader>ft :CtrlSFToggle<CR>
inoremap <S-f>t <Esc>:CtrlSFToggle<CR>

nnoremap <C-b>   :NvimTreeToggle<CR>
nnoremap <C-S-b> :NvimTreeFocus<CR>
nnoremap <M-r>   :NvimTreeFindFile<CR>

" Ctrl-Option-Left or Right to move prev / next tab
noremap <silent> <C-Left> <Esc>:tabprevious<CR>
noremap <silent> <C-Right> <Esc>:tabnext<CR>

" save shortcut
noremap <M-s> <Esc>:w<CR>
inoremap <M-s> <Esc>:w<CR>
" close window
noremap <M-w> <Esc>:bd<CR>
inoremap <M-w> <Esc>:bd<CR>
" quit app, prompt enter to confirm
noremap <M-q> <Esc>:qa!
inoremap <M-q> <Esc>:qa!
" ctrl-c copy to clipboard
vnoremap <C-c> "+y<CR>
" scroll horizontal with Ctrl
noremap <C-ScrollWheelUp> <ScrollWheelLeft>
noremap <C-ScrollWheelDown> <ScrollWheelRight>
" turnoff  highlight
nnoremap <silent> <C-h> <Esc>:nohlsearch<CR>
" toggle word wrap
nnoremap <silent> <C-M-Z> <Esc>:set wrap!<CR>
" insert current ISO date time
inoremap <silent> <C-M-t> <C-r>=strftime('%FT%T%z')<CR>
nnoremap <silent> <C-M-t> "=strftime('%FT%T%z')<CR>P
" sort lines
vnoremap <silent> <F5> :'<, '>sort<CR>
nnoremap <silent> <C-F5> :%sort<CR>
" exit terminal with Esc
tnoremap <Esc> <C-\><C-n>
" bufferline pick
nnoremap <silent> bg :BufferLinePick<CR>
nnoremap <silent> b] :BufferLineCycleNext<CR>
nnoremap <silent> b[ :BufferLineCyclePrev<CR>

" select quotes in visual mode (v', v", v`, v], v})
vnoremap <silent> ' i'
vnoremap <silent> " i"
vnoremap <silent> ` i`
vnoremap <silent> ] i]
vnoremap <silent> } i}
vnoremap <silent> ) i)

" vim line text-objects, excluding leading and trailing whitespace, eg: vil, dal
xnoremap il g_o^
onoremap il :normal vil<CR>
xnoremap al $o0
onoremap al :normal val<CR>

" Map CMD+Up / Down arrow to jump to the top / bottom of the buffer
nnoremap <D-Up> gg
nnoremap <D-Down> G
" Map CMD+Left / Right arrow to jump to the start / end of the line
nnoremap <D-Left> 0
nnoremap <D-Right> $
" Toggle comment with CMD+/
nnoremap <D-/> gcc
" Save buffer with CMD+S in all mode
noremap <D-s> :w<CR>

" custom vim-surround
" wrap text with **bold** format when surround with * character
autocmd FileType markdown let g:surround_42 = "**\r**"

" highlight focused file in nvim-tree
autocmd BufEnter NvimTree* set cursorline
" esc to normal when entering nvim-tree
autocmd FileType NvimTree au! BufEnter * stopinsert

" highlight yanked text
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=300}

" vim-prettier auto format on save, without @format pragma
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" vim-move settings
let g:move_key_modifier = 'M'
let g:move_key_modifier_visualmode = 'M'

" Visual Multi settings
let g:VM_leader = '='
let g:VM_maps = {}
let g:VM_maps['Find Under']             = '<C-d>'
let g:VM_maps['Find Subword Under']     = '<C-d>'
let g:VM_maps["Select Cursor Up"]       = '<M-C-Up>'     " start selecting up
let g:VM_maps["Select Cursor Down"]     = '<M-C-Down>'   " start selecting down
let g:VM_mouse_mappings = 1
let g:VM_maps["Mouse Cursor"]           = '<S-LeftMouse>'
let g:VM_maps["Mouse Word"]             = '<C-RightMouse>'
let g:VM_maps["Mouse Column"]           = '<S-RightMouse>'

" gitgutter
let g:gitgutter_sign_added = '│'      " look nicer and signal by color
let g:gitgutter_sign_modified = '│'   " look nicer and signal by color

" vim markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_fenced_languages = ['jsx=javascript', 'js=javascript', 'bash=sh', 'shell=sh']

"Copilot settings
let g:copilot_node_command = '/usr/local/bin/node'

" setup lua plugins
lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setup NVimTree
require("nvim-tree").setup {
  -- on_attach = on_attach, -- must define all keymaps if use
  hijack_cursor = true,
  -- open_on_tab = true,     -- open tree on new tab
  update_focused_file = {
    enable = true,
    debounce_delay = 15,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    timeout = 200,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
  },
  renderer = {
    highlight_git = true,
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  filters = {
    dotfiles = false,
    custom = { 
      "\\.DS_Store",
      "\\.cache",
      "\\.git$",
      "\\.linaria-cache",
      "\\.sass-cache",
      "__coverage__",
      "node_modules",
      "package-lock\\.json",
      "pnpm-lock\\.yaml",
      "yarn\\.lock",
    },
  },
  view = {
  },
}

-- open on setup for directory or noname buffer
local function open_nvim_tree(data)

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- setup lualine
vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
vim.g.gitblame_date_format = '%r'
vim.g.gitblame_message_template = '<author>, <date>'
local git_blame = require('gitblame')

require('lualine').setup {
  highlights = {
    background = {
      italic = true,
    },
    buffer_selected = {
      bold = true,
    },
  },
  options = {
    mode = "buffers",
    icons_enabled = true,
    theme = 'auto',
    color_icons = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    always_divide_middle = true,
    globalstatus = true,
    disabled_filetypes = {
      'NvimTree'
    },
    ignore_focus = {'NvimTree'},
  },
  sections = {
    lualine_b = {
      'branch',
      'diff',
      { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
      'diagnostics',
    },
  },
  -- tabline = {
  --   lualine_a = {
  --     {
  --       'buffers',
  --       mode = 2, -- Shows buffer name + buffer index
  --       filetype_names = {
  --         NvimTree = 'File Tree',
  --       }
  --     },
  --   },
  --   lualine_b = {},
  --   lualine_c = {},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {{'tabs', mode = 0}}, -- show only tab number
  -- },
  extensions = {'nvim-tree'}
}

-- setup bufferline
require("bufferline").setup {
  options = {
    mode = "buffers",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
    diagnostics = "nvim_lsp",
    indicator = {
      style = 'underline',
    },
    show_close_icon = true,
  },
}

-- improve indentline color
vim.cmd [[highlight IndentBlanklineChar guifg=#333f33]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#6699cc gui=nocombine]]

require'indent_blankline'.setup {
  show_current_context = true,
  -- show_current_context_start = true,
}

require'scrollbar'.setup {
  handle = {
    color = "#3f3f3f",
  },
  marks = {
    Search = { color = "#ff9e64"},
    Error = { color = "#db4b4b"},
    Warn = { color = "#e0af68"},
    Info = { color = "#0db9d7"},
    Hint = { color = "#1abc9c"},
    Misc = { color = "#9d7cd8"},
  }
}

require('nvim-autopairs').setup {}

require'colorizer'.setup()

require('Comment').setup()

require'nvim-treesitter.configs'.setup {
  -- Treesitter doc
  -- tree_docs = {
  --   enable = true,
  --   keymaps = {
  --     -- refer to https://github.com/nvim-treesitter/nvim-tree-docs/issues/8
  --     doc_node_at_cursor = "yd",
  --   },
  -- },
  -- A list of parser names, or "all"
  autotag = {
    enable = true,
  },
  -- Indentation based on treesitter for the = operator
  indent = {
    enable = true,
  },

  context_commentstring = {
    enable = true
  },

  ensure_installed = { "javascript", "css", "scss", "bash", "dockerfile", "gitignore", "json", "typescript", "tsx", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "html", "markdown" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.
-- vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Telescope
local actions = require('telescope.actions')
local dropdown_theme = require('telescope.themes').get_dropdown({
  results_height = 20;
  winblend = 20;
  width = 0.8;
  previewer = false;
})

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  pickers = {
    find_files = {
    --   theme = "dropdown",
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    current_buffer_fuzzy_find = {
      theme = "dropdown",
    },
    treesitter = {
      theme = "dropdown",
    },
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-S-p>', builtin.commands, {})
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<C-j>', builtin.treesitter, {})

-- LSP Mappings + Settings -----------------------------------------------------
-- modified from: https://github.com/neovim/nvim-lspconfig#suggested-configuration
local opts = { noremap=true, silent=true }
-- Basic diagnostic mappings, these will navigate to or display diagnostics
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings to magical LSP functions!
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-l>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'td', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- Enable hover documentation in a floating window (disable as shortcut is enough)
  -- vim.api.nvim_exec([[
  --   augroup lsp_hover_doc
  --   autocmd!
  --   autocmd CursorHold * silent! lua vim.lsp.buf.hover()
  --   autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
  --   autocmd CursorMoved * lua vim.lsp.buf.clear_references()
  --   augroup END
  -- ]], false)
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Capabilities required for the visualstudio lsps (css, html, etc)
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Activate LSPs
-- All LSPs in this list need to be manually installed via NPM/PNPM/whatevs
local lspconfig = require('lspconfig')
local servers = { 'tsserver', 'eslint' }
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilites = capabilities,
  }
end

-- This is an interesting one, for some reason these two LSPs (CSS/HTML) need to
-- be activated separately outside of the above loop. If someone can tell me why,
-- send me a note...
lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- gopls language server
-- util = require "lspconfig/util"
lspconfig.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = {"gopls", "serve"},
  -- filetypes = {"go", "gomod"},
  -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  -- settings = {
  --   gopls = {
  --     hoverKind = "FullDocumentation",
  --   },
  -- },
}

-- [LSP] Organize imports and format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    -- organize import
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    -- format buffer
    vim.lsp.buf.format()
  end
})

-- [LSP] Change inline diagnostic text to hover popup
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = false, --'rounded',
      source = 'always',
      -- prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

-- Change signcolumn diagnostic icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Luasnip ---------------------------------------------------------------------
-- Load as needed by filetype by the luasnippets folder in the config dir
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
-- set keybinds for both INSERT and VISUAL.
vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
-- Set this check up for nvim-cmp tab mapping
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- CMP - Autocompletion --------------------------------------------------------
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    -- ['<CR>'] = cmp.mapping({
    --   i = function(fallback)
    --     if cmp.visible() and cmp.get_active_entry() then
    --       cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
    --     else
    --       fallback()
    --     end
    --   end,
    --   s = cmp.mapping.confirm({ select = true }),
    --   c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    -- }),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Down>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s"}),
    ["<Up>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s"}),
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   -- elseif has_words_before() then
    --   --   cmp.complete()
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
    --
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  },
}

-- view Image
require('hologram').setup{
  auto_display = true -- WIP automatic markdown image display, may be prone to breaking
}

EOF


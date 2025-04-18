-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.keymap.set('n', '<leader>i', 'lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>', opts)
  end,
})

-- add kemap to open diagnostic window
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<cr>', {})

-- You'll find a list of language servers here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- These are example language servers. 
-- require('lspconfig').gleam.setup({})
-- require('lspconfig').ocamllsp.setup({})

-- lua langauge server: configured to work well for lua in nvim
require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

-- TRACE: 0
-- DEBUG: 1 
-- INFO:  2 
-- WARN:  3
-- ERROR: 4
-- OFF:   5
require('vim.lsp.log').set_level(0)
-- require('vim.lsp.log').get_filename()

local lspconfig = require'lspconfig'

lspconfig.clangd.setup{}

-- mlir stuff
lspconfig.mlir_lsp_server.setup{
   on_new_config = function(config)
     config.cmd = {
       "/home/zilleplus/code/cpp/mlir-experiment/build/bin/mlir-lsp"
     }
   end,
}
lspconfig.tblgen_lsp_server.setup({
   on_new_config = function(config)
     config.cmd = {
       "/home/zilleplus/public_code/llvm-18.1.6-assert/bin/tblgen-lsp-server",
       "--tablegen-compilation-database=/home/zilleplus/code/cpp/mlir-experiment/build/tablegen_compile_commands.yml"
     }
   end,
})
lspconfig.mlir_pdll_lsp_server.setup{
   on_new_config = function(config)
     config.cmd = {
       "llvm-18.1.6-assert/bin/pdll-lsp-server",
       "--tablegen-compilation-database=/home/zilleplus/code/cpp/mlir-experiment/build/tablegen_compile_commands.yml"
     }
   end,
}

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({select=true}),
    ['<Tab>'] = cmp.mapping.select_next_item({behavior=cmp.SelectBehavior.Select}),
  })
})

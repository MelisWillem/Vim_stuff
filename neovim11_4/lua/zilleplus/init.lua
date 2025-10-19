  --disable orignal mapping on K
vim.cmd [[map K <nop>]]
-- set the leader key
vim.g.mapleader="K"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    {'rose-pine/neovim', name = 'rose-pine' },
    {
      -- live-grep allows the user to add arguments to 
      -- rg while searching
      -- example: --glob=*.td tosa 
      --    -> find all the td files with tosa in it
      --    -> "!" negates the search
      "nvim-telescope/telescope-live-grep-args.nvim",
      dependencies = { 'nvim-lua/plenary.nvim', -- coroutines used by telescope
        'nvim-telescope/telescope.nvim' }
    }
})

-- disable the cursor
vim.opt.mouse=""

local opt = vim.opt
opt.expandtab=true
opt.shiftwidth=2
opt.smartindent=true

opt.pumheight=15
opt.number=true

vim.keymap.set('n', '<leader>e', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', '<C-j>', ':cn<CR>', {})
vim.keymap.set('n', '<C-k>', ':cp<CR>', {})
vim.keymap.set('n', '<leader>j', ':make', {})

vim.filetype.add({
  pattern = {
    -- mlir files are not detected by default
    ['.*.mlir'] = 'mlir',
  }
})

-- config part added to all lsp configs
vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  },
  root_markers = { '.git' },
})

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    -- Unset 'formatexpr'
    vim.bo[args.buf].formatexpr = nil
    -- Unset 'omnifunc'
    vim.bo[args.buf].omnifunc = nil
    local opts = {buffer = args.buf}
    -- vim.keymap.del('n', 'K', { buffer = args.buf })
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

vim.lsp.enable('lua_language_server')
vim.lsp.enable('clangd')
vim.lsp.enable('tablegen_lsp_server')
vim.lsp.enable('mlir_lsp_server')

-- TRACE: 0
-- DEBUG: 1 
-- INFO:  2 
-- WARN:  3
-- ERROR: 4
-- OFF:   5
-- require('vim.lsp.log').set_level(0)
-- require('vim.lsp.log').get_filename()


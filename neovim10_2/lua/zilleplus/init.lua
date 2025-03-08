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
    {'neovim/nvim-lspconfig'},
    {'p00f/clangd_extensions.nvim'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'rose-pine/neovim', name = 'rose-pine' },
    {
      -- live-grep allows the user to add arguments to 
      -- rg while searching
      -- example: --glob=*.td tosa 
      --    -> find all the td files with tosa in it
      --    -> "!" negates the search
      "nvim-telescope/telescope-live-grep-args.nvim",
      dependencies = 
      { 'nvim-lua/plenary.nvim', -- coroutines used by telescope
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

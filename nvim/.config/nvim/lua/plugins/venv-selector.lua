return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  },
  ft = 'python', -- Load when opening Python files
  keys = {
    { '<leader>v', '<cmd>VenvSelect<cr>', desc = 'Select Python virtual environment' },
  },
  opts = {
    -- Default options; can be customized as needed
  },
}

return {
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "gthelding/monokai-pro.nvim", lazy = true },
	{ "rose-pine/neovim", lazy = true },
	{ "catppuccin/nvim", lazy = true },
	{ "neanias/everforest-nvim", lazy = true },
	{ "ribru17/bamboo.nvim", lazy = true },
	{ "tahayvr/matteblack.nvim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "kepano/flexoki-neovim", lazy = true },

{
    "rebelot/kanagawa.nvim" ,
    lazy = false,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('kanagawa').setup {
        commentStyle = { italic = false },
        transparent = true,
        terminalColors = true,
        theme = 'dragon',
        colors = {
          theme = { all = { ui = { bg_gutter = 'none' } } },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          }
        end,
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'kanagawa'
    end,
},


}

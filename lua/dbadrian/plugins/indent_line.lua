return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = { char = '│' }, -- set indent character
      scope = { enabled = true }, -- highlight current scope
    },
    config = function(_, opts)
      local ibl = require 'ibl'
      local hooks = require 'ibl.hooks'

      -- Define rainbow highlight groups
      local rainbow_colors = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
      }

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
        vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
        vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
        vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
      end)

      local rainbow_colors_enabled = false
      -- opts.indent.highlight = rainbow_colors
      -- Set up ibl
      require('ibl').setup(opts)

      -- Show dots for spaces
      vim.opt.list = true
      -- vim.opt.listchars:append 'space:·'
      -- (optional) also show tabs or trailing spaces:
      vim.opt.listchars:append 'tab:»·'
      vim.opt.listchars:append 'trail:•'
      -- Toggle function
      local function toggle_rainbow()
        rainbow_colors_enabled = not rainbow_colors_enabled
        if rainbow_colors_enabled then
          opts.indent.highlight = rainbow_colors
        else
          opts.indent.highlight = { 'IblIndent' } -- fallback to single color
        end
        ibl.setup(opts)
      end

      -- Keymap <leader>L
      vim.keymap.set('n', '<leader>L', toggle_rainbow, { desc = 'Toggle rainbow indent guides' })
    end,
  },
}

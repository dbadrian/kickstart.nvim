-- kinda yanked from tjdevries
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>A', function()
      harpoon:list():prepend()
    end, { desc = 'Pre[A]ppend to harpoon' })
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = '[a]ppend to harpoon' })
    vim.keymap.set('n', '<leader>P', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'har[P]oon' })

    -- Set <space>1..<space>5 be my shortcuts to moving to the files
    for _, idx in ipairs { 1, 2, 3, 4, 5 } do
      vim.keymap.set('n', string.format('<leader>%d', idx), function()
        harpoon:list():select(idx)
      end)
    end
  end,
}

vim.keymap.set('n', '<leader>cr', function()
  vim.cmd 'CargoRun'
end, { buffer = true, desc = 'cargo run' })

vim.keymap.set('n', '<leader>cR', function()
  vim.ui.input({ prompt = 'Program arguments: ' }, function(input)
    if input == nil then
      return
    end
    vim.cmd('CargoRun ' .. input)
  end)
end, { buffer = true, desc = 'cargo run with args' })

vim.keymap.set('n', '<leader>ct', function()
  vim.cmd 'CargoTest'
end, { buffer = true, desc = 'cargo test' })
vim.keymap.set('n', '<leader>cT', function()
  vim.ui.input({ prompt = 'Program arguments: ' }, function(input)
    if input == nil then
      return
    end
    vim.cmd('CargoTest ' .. input)
  end)
end, { buffer = true, desc = 'cargo test with args' })

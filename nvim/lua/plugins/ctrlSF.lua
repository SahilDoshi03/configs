return {
  'dyng/ctrlsf.vim',
  dependencies = { 'wincent/ferret' }, -- Optional but improves search
  config = function()
    vim.g.ctrlsf_default_root = 'project'
    vim.g.ctrlsf_auto_close = {
      at_exit = 0,
      at_entry = 0,
    }
    vim.g.ctrlsf_position = 'left'
    vim.g.ctrlsf_auto_focus = {
      at_open = true,
    }
  end
}


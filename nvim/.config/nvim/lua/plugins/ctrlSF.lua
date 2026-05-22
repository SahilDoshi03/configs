return {
  'dyng/ctrlsf.vim',
  dependencies = { 'wincent/ferret' }, -- Optional but improves search
  config = function()
    vim.g.ctrlsf_default_root = 'project'
    vim.g.ctrlsf_auto_close = 0
    vim.g.ctrlsf_auto_focus = { at = "start" }

    vim.g.ctrlsf_position = 'left'
    vim.g.ctrlsf_winsize = "40"

    vim.keymap.set('n', '<C-f>', ':CtrlSF ', { noremap = true })
  end
}

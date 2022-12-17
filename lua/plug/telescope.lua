
local M = {}

M.vimrc = function()
  local builtin = require('telescope.builtin')

  builtin.find_files({ -- file_browser, live_grep, git_files    
      prompt_title = 'Vimrc Config',
      file_ignore_patterns = {'UltiSnips/*.*', 'plugin/packer_compiled.lua'},
      cwd = '~/.config/nvim/'
  })
end

return M

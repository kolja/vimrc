
return {
    'stevearc/oil.nvim',
    cmd = "Oil",
    config = function()
      local util = require("oil.util")
      local oil = require("oil")
      vim.api.nvim_create_autocmd("User", {
        pattern = "OilEnter",
        callback = vim.schedule_wrap(function(args)
          if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
            local winid = util.get_preview_win()
            if not winid then
              oil.open_preview({split = 'botright'})
            end
          end
        end),
      })
      oil.setup({
        keymaps = {
          ["~"] = function () require("oil").open("~") end,
          ["q"] = "actions.close",
          ["<"] = "actions.parent",
          [">"] = "actions.select",
          ["?"] = "actions.show_help",
        },
        preview = {
          max_width = { 30, 0.3 },
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }

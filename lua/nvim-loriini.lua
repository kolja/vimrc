local opts = {
  relative = 'editor',
  width = 50,
  height = 10,
  row = 3,
  col = 10,
  border = 'none',
}
local bufnr = vim.api.nvim_create_buf(false, true)
local winnr = vim.api.nvim_open_win(bufnr, true, opts)

-- Start the Rust terminal application in the new floating terminal window
vim.fn.termopen('/Users/kolja/dev/loriini/target/debug/loriini')
-- Wait for the terminal buffer to be created
vim.wait(500, function() return vim.fn.bufexists(bufnr) end)

vim.api.nvim_buf_call(bufnr, function()
  -- Enter a command in the terminal
  -- vim.fn.chansend(vim.b.term_buffers[vim.fn.bufnr('%')].job_id, 'Plus\n')
end)

-- Register an RPC handler to listen for messages from the Rust terminal application
-- vim.fn.rpcrequest(vim.api.nvim_get_current_buf(), 'nvim_buf_attach', {false, {on_lines=function(_, _, _, _, _, _)
  -- Handle the received message here
-- end}})

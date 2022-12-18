
-- see: https://github.com/VonHeikemen/lsp-zero.nvim

local lsp = require('lsp-zero')

lsp.ensure_installed({
  'sumneko_lua',
  'rust_analyzer',
})

lsp.preset("recommended")

lsp.set_preferences({
  -- suggest_lsp_servers = true,
  -- setup_servers_on_start = true,
  -- set_lsp_keymaps = true,
  -- configure_diagnostics = true,
  -- cmp_capabilities = true,
  -- manage_nvim_cmp = true, -- was true
  -- call_servers = 'local',
  sign_icons = {
    error = '►',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

local cmp = require('cmp')
local luasnip = require("luasnip")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ["<C-l>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
      elseif has_words_before() then
          cmp.complete()
      else
          fallback()
      end
  end, { "i", "s" }),
  ["<C-h>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
          cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
      else
          fallback()
      end
  end, { "i", "s" }),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<ESC>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
  }),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>w", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>D", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>R", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<leader>S", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()

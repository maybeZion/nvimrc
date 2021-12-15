-- write as sudo
local lsp = require "lspconfig"
local coq = require "coq"
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end  

function get_lsp_count()
  if vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    return ''
  end
  local diag = ''
  local error_count = vim.lsp.diagnostic.get_count(0, 'Error')
  if error_count > 0 then
    diag = diag .. string.format("  %s ", error_count)
  end

  local warning_count = vim.lsp.diagnostic.get_count(0, 'Warning')
  if warning_count > 0 then
    diag = diag .. string.format(" %s ", warning_count)
  end

  local info_count = vim.lsp.diagnostic.get_count(0, 'Information')
  if info_count > 0 then
    diag = diag .. string.format(" %s ", info_count)
  end

  local hint_count = vim.lsp.diagnostic.get_count(0, 'Hint')
  if hint_count > 0 then
    diag = diag .. string.format(" %s ", hint_count)
  end
  return diag
end

-- LSP imports
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.solargraph.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}

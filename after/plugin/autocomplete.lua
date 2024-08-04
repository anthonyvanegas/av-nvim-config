local lspconfig = require('lspconfig')

local servers = { 'lua_ls', 'pylsp', 'ruff_lsp'}
for _, lsp in ipairs(servers) do
    local opts = {buffer = bufnr, remap = false}
    lspconfig[lsp].setup {
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts),
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts),
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts),
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts),
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts),
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts),
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts),
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts),
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts),
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts),
    }
end

local luasnip = require 'luasnip'

local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-n>'] = cmp.mapping.scroll_docs(4), -- Down
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { 'i', 's' }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

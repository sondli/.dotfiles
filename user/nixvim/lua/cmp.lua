local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm(),
        ['<C-u'] = cmp.mapping.scroll_docs(-4),
        ['<C-d'] = cmp.mapping.scroll_docs(4)
    })
})

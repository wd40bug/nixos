-- https://luals.github.io/wiki/settings/

Luasnip.add_snippets('lua', {
  Luasnip.snippet(
    '---@type', {
      Luasnip.text_node('---@type '),
      Luasnip.insert_node(1, 'type')
    }
  )
})

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Typst centered math block
  s("math", {
    t({ "$", "\t" }), -- First line is $, second line starts with a tab
    i(1),             -- This is where your cursor lands ($1)
    t({ "", "$" })    -- Enter to a new line, then place the closing $
  }),


  -- Triple quote block for docstrings
  s("doc", {
    t({ '"""', "" }), -- First line is """, then enter to a new line
    i(1),             -- Cursor lands here
    t({ "", '"""' })  -- Enter to a new line, then closing """
  }),

  -- Triple quote block for docstrings alt
  s('""', {
    t({ '"""', "" }), -- First line is """, then enter to a new line
    i(1),             -- Cursor lands here
    t({ "", '"""' })  -- Enter to a new line, then closing """
  }),
}

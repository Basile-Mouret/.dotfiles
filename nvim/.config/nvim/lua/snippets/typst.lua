local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- snippets definition :
-- s : command
-- t : text
-- i : input

return {
  s("today", {t(os.date("%d-%m-%Y"))}),
  s("math", {
    t("$"),
    i(1, "content"),
    t("$"),
  }),

  -- theorems
  
  s("theorem", {
    t("#theorem(\""),
    i(1, "name"),
    t("\")[\n"),
    i(2, "content"),
    t("\n]"),
  }),
  s("lemma", {
    t("#lemma["),
    i(1, "content"),
    t("]"),
  }),
  s("proof", {
    t("#proof["),
    i(1, "content"),
    t("]"),
  }),
  s("def", {
    t("#definition(\""),
    i(1, "name"),
    t("\")[\n"),
    i(2, "content"),
    t("\n]"),
  }),
  s("corollary", {
    t("#corollary["),
    i(1, "content"),
    t("]"),
  }),
  s("example", {
    t("#example(\""),
    i(1, "name"),
    t("\")[\n"),
    i(2, "content"),
    t("\n]"),
  }),
  s("remark", {
    t("#remark["),
    i(1, "content"),
    t("]"),
  }),

  -- Math expressions

  s("int", {
    t("integral_"),
    i(1, "a"),
    t("^"),
    i(2, "b"),
    t(" "),
    i(3, "f(x)"),
    t(" dif x")
  }),
  s("sum", {
    t("sum_("),
    i(1, "i=1"),
    t(")^"),
    i(2, "n"),
    t(" "),
    i(3, "a_i")
  }),
  s("prod", {
    t("product_("),
    i(1, "i=1"),
    t(")^"),
    i(2, "n"),
    t(" "),
    i(3, "a_i")
  }),
  s("lim", {
    t("lim_("),
    i(1, "x -> infinity"),
    t(") "),
    i(2, "f(x)")
  }),
  s("frac", {
    t("frac("),
    i(1, "numerator"),
    t(", "),
    i(2, "denominator"),
    t(")")
  }),
  s("sqrt", {
    t("sqrt("),
    i(1, "expression"),
    t(")")
  }),
  s("partial", {
    t("(partial "),
    i(1, "f"),
    t(")/(partial "),
    i(2, "x"),
    t(")")
  }),

--- other ---

  s("link", {
    t("link(\""),
    i(1, "https://example.com"),
    t("\")["),
    i(2, "link text"),
    t("]")
  }),
  s("figure", {
    t("#figure("),
    t({ "", "  " }),
    i(1, "image(\"path/to/image.png\")"),
    t({ "", "  caption: [" }),
    i(2, "Caption text"),
    t({ "]", ")" })
  }),
  s("code", {
    t("```"),
    i(1, "language"),
    t({ "", "" }),
    i(2, "code"),
    t({ "", "```" })
  }),

  -- Greek letters (common ones)

  s("alpha", { t("alpha") }),
  s("beta", { t("beta") }),
  s("gamma", { t("gamma") }),
  s("delta", { t("delta") }),
  s("epsilon", { t("epsilon") }),
  s("theta", { t("theta") }),
  s("lambda", { t("lambda") }),
  s("mu", { t("mu") }),
  s("pi", { t("pi") }),
  s("sigma", { t("sigma") }),
  s("phi", { t("phi") }),
  s("omega", { t("omega") }),
  
  -- Common math symbols

  s("infty", { t("infinity") }),
  s("leq", { t("<=") }),
  s("geq", { t(">=") }),
  s("neq", { t("!=") }),
  s("approx", { t("approx") }),
  s("equiv", { t("equiv") }),
  s("subset", { t("subset") }),
  s("supset", { t("supset") }),
  s("in", { t("in") }),
  s("notin", { t("in.not") }),
  s("cup", { t("union") }),
  s("cap", { t("sect") }),
  s("empty", { t("emptyset") }),

  -- templates

  s("notes_cours", {
    t({
      "#import \"@local/notes-template:1.0.0\": notes_template",
      "",
      "#show: notes_template(",
      "  course: \""
    }),
    i(1, "Course"),
    t({"\",", "  title: \""}),
    i(2, "Title"),
    t({"\",", "  date: \""}),
    i(3, "Date"),
    t({"\",", "  professor: \""}),
    i(4, "Professor"),
    t({
      "\"", 
      ")",
      "",
      "#import \"@local/theorems:1.0.0\": *",
      "#set heading(numbering:\"I.1\")",
      "#show: great-theorems-init"
      })

  }),

  --
}

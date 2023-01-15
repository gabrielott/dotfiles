local snippets = {
	s({ trig = "hinline", dscr = "Haskell code inline", snippetType="autosnippet" },
		fmta(
			"\\mintinline{haskell}{<>}",
			{
				i(1, "code"),
			}
		)
	),
	s({ trig = "texttt", dscr = "\\texttt{}", snippetType="autosnippet" },
		fmta(
			"\\texttt{<>}",
			{
				i(1, "code"),
			}
		)
	),
}

return snippets

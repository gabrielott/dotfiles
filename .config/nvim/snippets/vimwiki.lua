local snippets = {
	s({ trig = "pagelink", dscr = "Creates a link to another page with a display name" },
		fmta(
			"[[<>|<>]]",
			{
				f(function(args, _) return args[1][1]:lower():gsub("%s", "_") end, { 1 }),
				i(1, "display name"),
			}
		)
	),

	s({ trig = "newpage", dscr = "Template for a new wiki page" },
		fmta(
			[[
				%title <>
				%date <>

				= <> =
			]],
			{
				rep(1),
				f(function(_, _) return os.date("!%Y-%m-%d") end),
				i(1, "Title"),
			})
	),

	s({ trig = "details", dscr = "Creates a <details> tag with summary" },
		fmt(
			[[
				<details>
				<summary>{}</summary>
				{}
				</details>
			]],
			{
				i(1, "Summary"),
				i(2, "Content"),
			}
		)),

	s({ trig = "codeblock", dscr = "Creates a <details> tag with a code block inside" },
		fmt(
			[[
				<details>
				<summary>()</summary>
				{{{
				()
				}}}
				</details>
			]],
			{
				i(1, "Title"),
				i(2, "Code"),
			},
			{ delimiters = "()" }
		)),

	s({ trig = "response", dscr = "Creates a <details> tag with a request response inside" },
		fmt(
			[[
				<details>
				<summary>Response</summary>
				{{{
				()
				}}}
				</details>
			]],
			{
				i(1, "Content"),
			},
			{ delimiters = "()" }
		)),
}

return snippets

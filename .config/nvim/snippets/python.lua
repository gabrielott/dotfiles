local snippets = {
	s({ trig = "pwnexploit", dscr = "Template for pwn challenges in CTFs" },
		fmta(
			[[
				#!/usr/bin/env python3

				import argparse
				from pwn import *

				TARGET = "<>"
				REMOTE = ("<>", <>)

				context.log_level = "debug"
				context.terminal = ["tmux", "split-window", "-hf"]
				context.binary = TARGET

				def exploit(r, e):
					# gdb.attach(r)

				def main():
				    parser = argparse.ArgumentParser()
				    parser.add_argument("-r", "--remote", action="store_true", dest="remote",
				                        help="Run exploit on the remote target.")
				    args = parser.parse_args()

				    e = ELF(TARGET)
				    if args.remote:
				        r = remote(*REMOTE)
				    else:
				        r = process(TARGET)

				    exploit(r, e)

				if __name__ == "__main__":
				    main()
			]],
			{
				i(1, "binary path"),
				i(2, "remote IP"),
				i(3, "remote port"),
			}
		)
	),
}

return snippets

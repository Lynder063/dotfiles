# Contributing

Thanks for your interest in contributing to HyprLS :3!

## Setup your environment development

You just need to install:

- [Go](https://golang.org/doc/install)
- [Just](https://just.systems)

Then:

```sh
git clone --recurse-submodules https://github.com/your/fork
cd fork
just build
```

Then, you can build a binary locally with `just build`.
To create a "debug build" that logs all the requests, responses and server logs to files (useful for debugging), you can run `just build-debug`.

The debug binary is named `hyprlang-lsp` and the regular binary is named `hyprls`.

### VSCode

To develop the vscode extension, you'll also need:

- [VSCode](https://code.visualstudio.com/), really useful for debugging the extension, you just have to launch from the "start/debug" menu in the sidebar
- [Bun](https://bun.sh)

Then:

```sh
cd vscode
bun i
```

> **Note:** "Reloading" does not re-build the Go server, you'll need to kill the "Develoment Host Extension" window and kill the terminal that ran the `go:compile` task before launching again.

The VSCode dev environment is set up to use the debug binary in development. The path is absolute and hardcoded, so you may need to change it to where your debug binary is (check `vscode/src/extension.ts`).

## Implementing a new LSP feature

1. Make the server signal that it supports said feature in the `initialize` method in `handler.go`
2. Add a new file for the feature in the root directory (e.g. `formatting.go`)
3. Cut the corresponding method(s) from `unimplemented.go` and paste them in the new file

Read on for more details on the file structure.

## File structure

- `vscode/`: source code for the VSCode client extension
- `cmd/hyprls/main.go`: source code for the executable binary. should contain _very little_ code, just enough to start the server
- `handler.go`: defines the `Handler` struct, which is responsible for handling all the LSP requests. Also defines initialization code.
- `color.go`, `completion.go`, `hover.go`, `symbols.go`: code for the different LSP features
- `state.go`: in-memory map of the opened files' contents as well as a few functions to get things like the current section we are in, the current line, etc.
- `sync.go`: code for `did*` events (when the client signals that content was changed or that files were opened or closed). responsible for maintaining `state.go`'s data up-to-date
- `unimplemented.go`: stub functions for the LSP features that are not yet implemented
- `parser/`: source code for the parser:
   - `lowlevel.go`: the low-level parser, which reads the raw data from the server and converts it to sections, that contain:
      - assignments: setting a [variable](https://wiki.hyprland.org/Configuring/Variables)
	  - statements: stuff like `exec-once`, `bind`, etc (see [keywords](https://wiki.hyprland.org/Configuring/Keywords))
	  - sub-sections: sections nested within that section
   - `highlevel.go`: the high-level parser, which reads the sections and converts them to a more structured format. The file is generated by `parser/data/generate/main.go` from the wiki pages (continue reading for more information)
   - `decode.go`: transform the representation from the low-level parser to the high-level parser (WIP)
   - `data/`: code responsible for storing and getting all the config data: all the valid variable names, their types and descriptions, all valid keywords, etc.
     - `keywords.go`: all valid keywords with data to allow getting their documentation from wiki pages
	 - `sections.go`: code related to sections, mostly used by `parser/data/generate` to create the Go struct definitions for the high-level parser
	 - `variables.go`: same as `sections.go`, but for the different variables
	 - `load.go`: code to actually load all the data from the wiki pages. declares a few variables that embed the wiki pages' contents from `parser/data/sources`, then, in an `init()` function (which is run at the start of the program), it loads all the data from the wiki pages into the variables:
	 	1. Convert the markdown content to HTML
		2. Parse that HTML
		3. Walk through it, extracting data from tables and headings
		4. Store that data in `Section` and `Keywords`
	 - `sources/`: contains the wiki pages' markdown content. Copied `hyprland-wiki/pages/Configuring/*.md` to here when running `just build`
	 - `generate/`: code to generate the `highlevel.go` file from the wiki pages. Leverages the data loaded by `load.go` to generate the Go struct definitions for the high-level parser, and also output `ast.json` for debugging purposes (and later maybe to use _that_ instead of converting markdown to HTML and parsing every time the server starts, see #1)

## Commit names

We use the [gitmoji](https://gitmoji.dev/) convention for commit names.
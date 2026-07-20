# luabreakurl

**Breakable URLs with configurable continuation marks for LuaLaTeX**

`luabreakurl` is a small LuaLaTeX package for typesetting long URLs and URIs.

Unlike the standard `\url` command and the `xurl` package, `luabreakurl` can display a configurable continuation mark whenever a URL is actually broken across lines.

## Features

- clickable hyperlinks
- line breaks after almost every character
- URI scheme kept intact (`https://`, `ftp://`, `git+ssh://`, `mailto:`, `doi:`)
- configurable continuation mark
- normal text hyphenation remains unaffected
- implemented using modern LaTeX3 (`expl3`)

## Example

```latex
\breakurl{https://www.example.org/documentation/releases/2026/07/18/a/very/long/path/with/query/parameters?language=en&format=pdf&download=true}
```

## Configuration

The continuation mark can be changed globally:

```latex
\luabreakurlsetup{
  continuation={\tiny$\Rightarrow$}
}
```

or disabled completely:

```latex
\luabreakurlsetup{
  continuation={}
}
```

## Why another URL package?

The standard packages `url` and `xurl` provide many useful break points but intentionally do not indicate where a URL continues on the next line.

`luabreakurl` has a different goal:

- permit breaks after almost every character,
- visibly mark continuation across line breaks.

## Requirements

- LuaLaTeX
- hyperref

## Installation

```
lualatex luabreakurl.ins
```

This generates

```
luabreakurl.sty
```

Compile the documentation with

```
make
```

or manually

```
lualatex luabreakurl.dtx
makeindex -s gind.ist -o luabreakurl.ind luabreakurl.idx
makeindex -s gglo.ist -o luabreakurl.gls luabreakurl.glo
lualatex luabreakurl.dtx
lualatex luabreakurl.dtx
```

## License

MIT License.

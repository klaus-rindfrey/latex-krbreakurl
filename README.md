# krbreakurl

**Breakable URLs with configurable continuation marks for LuaLaTeX**

`krbreakurl` is a small LuaLaTeX package for typesetting long URLs and URIs.

Unlike the standard `\url` command and the `xurl` package, `krbreakurl` can display a configurable continuation mark whenever a URL is actually broken across lines.

## Features

- clickable hyperlinks
- line breaks after almost every character
- URI scheme kept intact (`https://`, `ftp://`, `git+ssh://`, `mailto:`, `doi:` …)
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
\krbreakurlsetup{
  continuation={\tiny$\Rightarrow$}
}
```

or disabled completely:

```latex
\krbreakurlsetup{
  continuation={}
}
```

## Why another URL package?

The standard packages `url` and `xurl` provide many useful break points but intentionally do not indicate where a URL continues on the next line.

`krbreakurl` has a different goal:

- permit breaks after almost every character,
- visibly mark continuation across line breaks.

## Requirements

- LuaLaTeX
- hyperref

## Installation

```
lualatex krbreakurl.ins
```

This generates

```
krbreakurl.sty
```

Compile the documentation with

```
make
```

or manually

```
lualatex krbreakurl.dtx
makeindex -s gind.ist -o krbreakurl.ind krbreakurl.idx
makeindex -s gglo.ist -o krbreakurl.gls krbreakurl.glo
lualatex krbreakurl.dtx
lualatex krbreakurl.dtx
```

## License

MIT License.

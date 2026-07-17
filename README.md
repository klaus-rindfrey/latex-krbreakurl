# krbreakurl

> Improved line breaking for long URLs and URIs in LuaLaTeX

`krbreakurl` is a lightweight LuaLaTeX package that improves the typesetting of
long URLs and URIs. It allows line breaks after almost every character while
keeping URI schemes such as `https://`, `mailto:` and `git+ssh://` intact.
Optionally, a visible continuation mark can be printed whenever a URL continues
on the next line.

## Why another URL package?

LaTeX already offers `\url` through `url` and `hyperref`, and the excellent
`xurl` package extends the available break points considerably.

`krbreakurl` was created with a different objective. Instead of optimizing the
list of legal break characters, it inserts a possible break after almost every
character. This gives TeX much more freedom when setting narrow columns or
documents containing exceptionally long URLs.

The package also offers an optional continuation mark, making wrapped URLs
easier to read.

## Features

- line breaks after almost every character
- URI schemes remain intact
- hyperlinks remain clickable
- configurable continuation mark
- ordinary text hyphenation remains unchanged
- compact implementation based on `expl3`
- designed for LuaLaTeX

## Requirements

- LuaLaTeX
- `hyperref`

## Installation

Place `krbreakurl.sty` in the same directory as your document, or install it in a
directory searched by TeX.

Load the package with:

```latex
\usepackage{krbreakurl}
```

## Basic usage

```latex
Please visit

\breakurl{https://www.example.org/a/very/long/path/that/will/eventually/wrap}

for further information.
```

## Configuration

Change the continuation mark globally:

```latex
\krbreakurlsetup{
  continuation={\tiny$\Rightarrow$}
}
```

Suppress it completely:

```latex
\krbreakurlsetup{
  continuation={}
}
```

The default is:

```latex
\tiny$\hookrightarrow$
```

## Supported URI schemes

URI schemes are recognized according to RFC 3986. Typical examples include:

- `https://`
- `http://`
- `ftp://`
- `file://`
- `git+ssh://`
- `mailto:`
- `doi:`

The scheme and an immediately following `//` are kept together.

## Comparison

| Package | Breaks after nearly every character | Protects URI scheme | Continuation mark |
|---|:---:|:---:|:---:|
| `url` | No | Yes | No |
| `xurl` | Mostly | Yes | No |
| `krbreakurl` | Yes | Yes | Yes |

## Implementation notes

Internally, the package:

- is written in `expl3`,
- creates hyperlinks with `\href`,
- inserts break opportunities with `\discretionary`,
- detects URI schemes using an RFC-3986-style regular expression,
- prevents a break at the stretchable glue preceding each discretionary.

## Limitations

- intended for LuaLaTeX
- intended for URLs and URIs
- not intended as a drop-in replacement for `xurl`
- currently provides one configuration option only

## Building the documentation

Generate `krbreakurl.pdf` from `krbreakurl.dtx` with:

```bash
latexmk -lualatex krbreakurl.dtx
```

The current repository keeps `krbreakurl.sty` alongside the documented
source. For a clean documentation rebuild:

```bash
latexmk -C krbreakurl.dtx
latexmk -lualatex krbreakurl.dtx
```

## License

MIT License.

## History

### Version 0.01

Initial implementation.

### Version 0.02

Internal improvements.

### Version 0.03

- generalized URI scheme detection
- added `\krbreakurlsetup`
- made the continuation mark configurable
- improved internal structure

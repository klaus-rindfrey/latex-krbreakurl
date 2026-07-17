# krbreakurl

`krbreakurl` is a small LuaLaTeX package for typesetting long URLs and
URIs with improved line breaking.

Unlike the standard `\url` command, `krbreakurl` allows line breaks
after almost every character while keeping URI schemes (such as
`https://` or `mailto:`) intact. When a line break occurs, an optional
continuation mark can be displayed.

## Why another URL package?

The standard LaTeX packages `url` and `hyperref` provide only limited
line breaking opportunities. The `xurl` package extends these
considerably.

`krbreakurl` has a different goal:

-   allow line breaks after almost every character,
-   preserve URI schemes,
-   keep hyperlinks clickable,
-   optionally display a continuation mark,
-   remain small and easy to understand.

## Requirements

-   LuaLaTeX
-   `hyperref`

## Installation

Copy `krbreakurl.sty` somewhere in TeX's search path, or place it in the
same directory as your document.

## Usage

Load the package:

``` latex
\usepackage{krbreakurl}
```

Typeset a URL:

``` latex
\breakurl{https://www.example.org/a/very/long/url}
```

## Configuration

The continuation mark is configurable.

Example:

``` latex
\krbreakurlsetup{
  continuation={\tiny$\Rightarrow$}
}
```

Disable the continuation mark completely:

``` latex
\krbreakurlsetup{
  continuation={}
}
```

## Supported URI schemes

The package recognizes URI schemes according to RFC 3986.

Examples include:

-   `https://`
-   `http://`
-   `ftp://`
-   `file://`
-   `git+ssh://`
-   `mailto:`
-   `doi:`

## Design goals

-   preserve clickable hyperlinks
-   preserve URI schemes
-   allow line breaks after almost every character
-   avoid affecting normal hyphenation
-   configurable continuation mark
-   compact implementation
-   LuaLaTeX only

## Implementation

Internally the package

-   uses `expl3`,
-   inserts breakpoints using `\discretionary`,
-   preserves hyperlinks with `\href`,
-   detects URI schemes according to RFC 3986.

## Limitations

-   intended for LuaLaTeX,
-   intended for URLs and URIs,
-   not intended as a replacement for `xurl`.

## License

MIT License.

## History

### Version 0.01

-   Initial implementation.

### Version 0.02

-   Internal improvements.

### Version 0.03

-   Generalized URI scheme detection.
-   Configurable continuation mark.

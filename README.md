# krbreakurl

> **Improved line breaking for long URLs and URIs in LuaLaTeX**

`krbreakurl` is a lightweight LuaLaTeX package that improves the
typesetting of long URLs and URIs. It allows line breaks after almost
every character while keeping URI schemes such as `https://`, `mailto:`
and `git+ssh://` intact. Optionally, a visible continuation mark can be
printed whenever a URL continues on the next line.

------------------------------------------------------------------------

# Why another URL package?

LaTeX already offers `\url` through `url` and `hyperref`, and the
excellent `xurl` package extends the available break points
considerably.

`krbreakurl` was created with a different objective.

Instead of optimizing the list of legal break characters, it inserts a
possible break after almost every character. This gives TeX much more
freedom when setting narrow columns or documents containing
exceptionally long URLs.

The package also offers an optional continuation mark, making wrapped
URLs easier to read.

------------------------------------------------------------------------

# Features

-   line breaks after almost every character
-   URI schemes remain intact
-   hyperlinks remain clickable
-   configurable continuation mark
-   does not affect ordinary text hyphenation
-   compact implementation based on `expl3`
-   designed for LuaLaTeX

------------------------------------------------------------------------

# Requirements

-   LuaLaTeX
-   `hyperref`

------------------------------------------------------------------------

# Installation

Copy `krbreakurl.sty` into your project directory or any directory
searched by TeX.

Load the package:

``` latex
\usepackage{krbreakurl}
```

------------------------------------------------------------------------

# Basic usage

``` latex
Please visit

\breakurl{https://www.example.org/a/very/long/path/that/will/eventually/wrap}

for further information.
```

------------------------------------------------------------------------

# Configuration

The continuation mark can be changed globally.

``` latex
\krbreakurlsetup{
  continuation={\tiny$\Rightarrow$}
}
```

To suppress it completely:

``` latex
\krbreakurlsetup{
  continuation={}
}
```

------------------------------------------------------------------------

# Supported URI schemes

URI schemes are recognized according to RFC 3986.

Typical examples include

-   `https://`
-   `http://`
-   `ftp://`
-   `file://`
-   `git+ssh://`
-   `mailto:`
-   `doi:`

------------------------------------------------------------------------

# Design goals

The package has deliberately modest goals:

-   produce aesthetically pleasing URL line breaks
-   preserve URI prefixes
-   preserve hyperlinks
-   keep the implementation small
-   remain easy to understand and maintain

------------------------------------------------------------------------

# Implementation notes

Internally the package

-   is written in `expl3`,
-   wraps hyperlinks using `\href`,
-   inserts break opportunities with `\discretionary`,
-   protects URI schemes before inserting break points.

------------------------------------------------------------------------

# Comparison

  --------------------------------------------------------------------------------
  Package          Nearly arbitrary breaks  Protect URI scheme  Continuation mark
  ---------------- ------------------------ ------------------- ------------------
  `url`                       No                    Yes                 No

  `xurl`                    Mostly                  Yes                 No

  **krbreakurl**             Yes                    Yes                Yes
  --------------------------------------------------------------------------------

------------------------------------------------------------------------

# Limitations

-   intended for LuaLaTeX
-   intended for URLs and URIs
-   not a replacement for `xurl`
-   currently focuses on practical URL typesetting rather than extensive
    package options

------------------------------------------------------------------------

# License

MIT License.

------------------------------------------------------------------------

# History

## Version 0.01

Initial implementation.

## Version 0.02

Internal refactoring.

## Version 0.03

-   generalized URI scheme detection
-   configurable continuation mark
-   improved internal structure

------------------------------------------------------------------------

# Future work

Possible future enhancements include

-   additional configuration options
-   optional package options
-   CTAN distribution
-   documented test suite
-   `.dtx` source distribution

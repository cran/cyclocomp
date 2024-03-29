
# cyclocomp

> Cyclomatic Complexity of R Code

<!-- badges: start -->

[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![](https://www.r-pkg.org/badges/version/cyclocomp)](https://www.r-pkg.org/pkg/cyclocomp)
[![CRAN RStudio mirror
downloads](https://cranlogs.r-pkg.org/badges/cyclocomp)](https://www.r-pkg.org/pkg/cyclocomp)
[![Coverage
Status](https://img.shields.io/codecov/c/github/Gaborcsardi/cyclocomp/main.svg)](https://app.codecov.io/github/Gaborcsardi/cyclocomp?branch=main)
[![R-CMD-check](https://github.com/gaborcsardi/cyclocomp/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/gaborcsardi/cyclocomp/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Cyclomatic complexity is a software metric (measurement), used to
indicate the complexity of a program. It is a quantitative measure of
the number of linearly independent paths through a program’s source
code. It was developed by Thomas J. McCabe, Sr. in 1976.

## Installation

``` r
devtools::install_github("Gaborcsardi/cyclocomp")
```

## Usage

``` r
library(cyclocomp)
```

`cyclocomp` takes quoted R expressions or function objects, and returns
a single integer, the cyclomatic complexity of the expression or
function.

``` r
cyclocomp(quote( if (condition) "foo" else "bar" ))
```

    #> [1] 2

``` r
cyclocomp(quote( while (condition) { loop } ))
```

    #> [1] 3

``` r
cyclocomp(
  function(arg) { calulate(this); and(that) }
)
```

    #> [1] 1

``` r
cyclocomp(ls)
```

    #> [1] 10

``` r
cyclocomp(cyclocomp)
```

    #> [1] 1

Some more examples for the R control structures. A simple `if` first:

``` r
cyclocomp(quote({
  if (condition) this
}))
```

    #> [1] 2

An `if` with an `else` branch:

``` r
cyclocomp(quote({
  if (condition) this else that
}))
```

    #> [1] 2

Loops:

``` r
cyclocomp(quote({
  for (var in seq) expr
}))
```

    #> [1] 3

``` r
cyclocomp(quote({
  while (cond) expr
}))
```

    #> [1] 3

``` r
cyclocomp(quote({
  repeat expr
}))
```

    #> [1] 2

`break` and `next` statements add to the complexity:

``` r
cyclocomp(quote({
  for (var in seq) {
    this
    break
    that
  }
}))
```

    #> [1] 4

``` r
cyclocomp(quote({
  for (var in seq) {
    this
    next
    that
  }
}))
```

    #> [1] 4

Multiple (explicit or implicit) `return` calls also add to the
complexity:

``` r
f <- function(arg) {
  if (arg) {
    return("this")
  } else {
    return("that")
  }
  "Otherwise return me"
}
cyclocomp(f)
```

    #> [1] 4

## License

MIT © Mango Solutions; Posit Software, PBC

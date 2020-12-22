
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mortgager

<!-- badges: start -->

<!-- badges: end -->

This package obtains various values such as monthly mortgage payment
amounts, downpayment amounts, minimum income required for affordable
home-ownership etc.

## Installation

You can install the released version of mortgager with:

``` r
devtools::install_github("aseemdeodhar/mortgager")
```

## mortgager

Load the  package with this line:

``` r
library(mortgager)
```

## Examples for each function:

### mortgager::monthlypayment()

calculates monthly home-ownership costs based on tax rates, interest
rates, downpayment amount, and home cost price.

``` r
monthlypayment(mortgage_rate = 3,
               property_tax = 12,
               home_price = 450000)
#> [1] 3308.015
```

### mortgager::max\_homeprice()

calculates maximum affordable home price based on annual income with a
set monthly housing cost percentage (default is 30%).

``` r
max_homeprice(annualinc = c(61000, 75000, 22330, 120000),
              mortgage_rate = 2.7,
              property_tax = 6)
#> # A tibble: 4 x 4
#>   income_level atincome  at80pc at120pc
#>          <dbl>    <dbl>   <dbl>   <dbl>
#> 1        61000  224144. 179316. 268973.
#> 2        75000  278561. 222849. 334273.
#> 3        22330   73838.  59070.  88606.
#> 4       120000  453471. 362777. 544166.
```

### mortgager::downpayment()

calculates the total downpayment amount based on sale price and mortgage
amount.

``` r
downpayment(home_price = 250000,
            mortgage_amount = 0.90)
#> [1] 25000
```

### mortgager::min\_anninc()

calculates the minimum annual income required for total housing costs to
remain at or below 30% of household income.

``` r
min_anninc(2000)
#> [1] 80000
```

### mortgager::burd\_anninc()

calculates the minimum annual income required for total housing costs to
remain at or below 50% of household income.

``` r
burd_anninc(2000)
#> [1] 48000
```

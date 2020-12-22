#' Minimum Non-Burdened Income
#'
#' Minimum annual income required for total housing costs to remain at or below 30% of household income:
#'
#' @param monthlypayment Total Monthly payments towards home-ownership
#'
#' @return Minimum Annual Income required to keep \code{monthlypayment} at or below 30% of income
#' @export
#'
#' @examples
#'
#' min_anninc(2000)
min_anninc <- function(monthlypayment){
  output <- (monthlypayment*12)*100/30
  return(output)
}

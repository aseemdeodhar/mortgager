#' Burdened Income
#' Minimum annual income required for total housing costs to remain at or below 50% of household income:
#'
#' @param monthlypayment Total Monthly payments towards home-ownership
#'
#' @return Minimum Annual Income required to keep \code{monthlypayment} at or below 50% of income
#' @export
#'
#' @examples
#'
#' burd_anninc(2000)
burd_anninc <- function(monthlypayment){
  output <- (monthlypayment*12)*100/50
  return(output)
}

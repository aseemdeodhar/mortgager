#' Minimum Required Income for Homeownership
#'
#' Minimum annual income required for total housing costs to remain at or below set percent threshold of household income:
#'
#' @param monthlypayment Total Monthly payments towards home-ownership
#' @param housing_cost_rate Monthly rate (out of 1) towards home-ownership costs (default: 0.3)
#'
#' @return Minimum Annual Income required to keep \code{monthlypayment} at or below set percent threshold of household income:
#' @export
#'
#' @examples
#' reqd_income(monthlypayment = 2000,
#'             housing_cost_rate = 0.30)
reqd_income <- function(monthlypayment,
                        housing_cost_rate = 0.30){
  output <- (monthlypayment*12)*1/housing_cost_rate
  return(output)
}

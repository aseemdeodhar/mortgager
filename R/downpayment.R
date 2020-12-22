#' Down-payment Amount
#'
#' Total downpayment based on sale price and mortgage amount (out of 1)
#'
#' @param home_price Sale Price of property in question
#' @param mortgage_amount Mortgage as a proportion (out of 1) of sale price (default: 0.90)
#'
#' @return The down-payment based on what proportion (\code{mortgage_amount}) of the \code{home_price} will be paid
#' @export
#'
#' @examples
#' downpayment(home_price = 250000,
#'             mortgage_amount = 0.90)
downpayment <- function(home_price,
                        mortgage_amount = 0.90){
  output <- home_price*(1-mortgage_amount)
  return(output)
}

#' Down-payment Amount
#'
#' Total downpayment based on sale price and mortgage amount (out of 1)
#'
#' @param downpayment_rate Downpayment as a proportion (out of 1) of sale price (default: 0.10)
#' @param home_price Sale Price of property in question
#'
#' @return The down-payment based on what proportion (\code{mortgage_amount}) of the \code{home_price} will be paid
#' @export
#'
#' @examples
#' downpayment_amt(home_price = 250000,
#'             downpayment_rate = 0.10)
downpayment_amt <- function(home_price,
                        downpayment_rate = 0.10){
  output <- home_price*(1-downpayment_rate)
  return(output)
}

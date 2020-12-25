#' Monthly Payments
#'
#' Function to calculate monthly home-ownership costs based on tax rates, interest rates and maintenance rates
#'
#' @param mortgage_rate Fixed monthly mortgage interest rate in percentage (out of 100)
#' @param property_tax Property tax rate per thousand (out of 1000) for the given area -
#'                     NOTE: Generally property taxes are always mentioned per thousand
#' @param home_price Sale Price of property in question
#' @param homeowners_ins Annual home owners insurance costs (default: 1000)
#' @param condo_fee Annual condo fee (default: 1000)
#' @param mortgage_amount Mortgage as a proportion (out of 1) of sale price (default: 0.90)
#' @param loan_term Duration of loan payback time in years (default: 30)
#' @param pmi_factor For loans with less than 20% downpayment, mortgage insurance rate in percent (out of 100) (default: 7.5)
#'
#' @export
#'
#' @examples
#' monthlypayment(mortgage_rate = 2.7,
#'                property_tax = 6,
#'                home_price = 350000)
monthlypayment <- function(mortgage_rate,
                           property_tax,
                           home_price,
                           homeowners_ins = 1000,
                           condo_fee = 1000,
                           mortgage_amount = 0.90,
                           loan_term = 30,
                           pmi_factor = 7.5) {
  monthly_proptax = (home_price*(property_tax/12000))
  monthly_mortgage = ((home_price*mortgage_amount)*((mortgage_rate/1200)*((1+(mortgage_rate/1200))^(12*loan_term))/(((1+mortgage_rate/1200)^(12*loan_term))-1)))
  monthly_hoins = (homeowners_ins/12)
  monthly_pmifactor = (monthly_mortgage*(pmi_factor/12))
  monthlypayments = dplyr::case_when(mortgage_amount > 0.8 ~ monthly_proptax + monthly_mortgage + monthly_hoins + monthly_pmifactor,
                                     mortgage_amount <= 0.8 ~ monthly_proptax + monthly_mortgage + monthly_hoins)
  return(monthlypayments)
}

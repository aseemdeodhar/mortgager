#' Affordable Home Price based on AMI - Area Median Income
#'
#' AMI for the Boston-Cambridge-Newton MA-NH Metro Area 2019 ACS-5 Year Estimates at: 86274 USD
#' https://data.census.gov/cedsci/table?q=area%20median%20income&g=314M500US1446014454,1446015764&tid=ACSST5Y2019.S1903&hidePreview=true
#'
#' @param mortgage_rate Fixed monthly mortgage interest rate in percentage (out of 100)
#' @param property_tax Property tax rate per thousand (out of 1000) for the given area -
#'                     NOTE: Generally property taxes are always mentioned per thousand
#' @param annualinc Household Income (default is median for Boston Metro 2019 ACS 5yr estimate)
#' @param max_monthly_rate Maximum monthly rate (out of 1) towards homeownership costs (default: 0.3)
#' @param homeowners_ins Annual home owners insurance costs (default: 1000)
#' @param condo_fee Annual condo fee (default: 1000)
#' @param loan_term Duration of loan payback time in years (default: 30)
#' @param pmi_factor For loans with less than 20% downpayment, mortgage insurance rate in percent (out of 100) (default: 7.5)
#' @param downpayment_rate Downpayment as a proportion (out of 1) of sale price (default: 0.10)
#'
#' @export
#'
#' @examples
#'
#' max_homeprice(annualinc = c(61000, 75000, 22330, 120000),
#'               mortgage_rate = 2.7,
#'               property_tax = 6)
max_homeprice <- function(mortgage_rate,
                      property_tax,
                      annualinc = 69037.5,
                      max_monthly_rate = 0.30,
                      homeowners_ins = 1000,
                      condo_fee = 1000,
                      downpayment_rate = 0.10,
                      loan_term = 30,
                      pmi_factor = 7.5) {
  max_monthly_amt = (annualinc * max_monthly_rate)/12
  monthly_hoins = homeowners_ins/12
  homeprice = dplyr::case_when(downpayment_rate  < 0.20 ~ (max_monthly_amt - monthly_hoins)/( property_tax/12000 + (1-downpayment_rate) * (((mortgage_rate/1200)*((1+(mortgage_rate/1200))^(12*loan_term))/(((1+mortgage_rate/1200)^(12*loan_term))-1))) * (1 + pmi_factor/12) ),
                               downpayment_rate >= 0.20 ~ (max_monthly_amt - monthly_hoins)/( property_tax/12000 + (1-downpayment_rate) * (((mortgage_rate/1200)*((1+(mortgage_rate/1200))^(12*loan_term))/(((1+mortgage_rate/1200)^(12*loan_term))-1))) * (1 + 0/12) ))
  max_homeprice = tibble::tibble(income_level = annualinc,
                                 atincome = homeprice,
                                 at80pc = homeprice*0.80,
                                 at120pc = homeprice*1.20)
  return(max_homeprice)
}

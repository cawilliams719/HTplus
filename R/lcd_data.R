#' A Data Download Function
#' @description This function downloads meteorological station data from NOAA's Local Climatological Data (LCD). Additionally this function utilizes the `lcd` function from the `rnoaa` package. The purpose of this function is to create a tibble of station data over a 10 year period.
#' @param fun The function parameter must equal "download." If else, the function will not run. This parameter indicates that you wish to download data.
#' @param x x must equal a vector of LCD stations.
#' @details The function is designed to download data for the years 2005 to 2014, however the code can be adapted to the user's data needs. The code iterates through a list of LCD stations to create a list of tibbles for each station for the 10 year period. For more information on the `lcd` function, please refer to the `rnoaa` package.
#'
#' @export
#' @seealso
#'   \code{\link[rnoaa]{lcd}} for more information on the function utilized in `lcd_data`.
#' @examples

lcd_data <- function (x, fun) {
  if (fun == "2005_2014") {
    lapply(x, function (x)
      as_tibble(rbind.fill(lcd(x, year = 2005),
                           lcd(x, year = 2006),
                           lcd(x, year = 2007),
                           lcd(x, year = 2008),
                           lcd(x, year = 2009),
                           lcd(x, year = 2010),
                           lcd(x, year = 2011),
                           lcd(x, year = 2012),
                           lcd(x, year = 2013),
                           lcd(x, year = 2014))))
  } else if (fun == "2005") {
    lapply(x, function (x)
      as_tibble(rbind.fill(lcd(x, year = 2005))))
  } else if (fun == "2006_2014") {
    lapply(x, function (x)
      as_tibble(rbind.fill(lcd(x, year = 2006),
                           lcd(x, year = 2007),
                           lcd(x, year = 2008),
                           lcd(x, year = 2009),
                           lcd(x, year = 2010),
                           lcd(x, year = 2011),
                           lcd(x, year = 2012),
                           lcd(x, year = 2013),
                           lcd(x, year = 2014))))
  } else if (fun == "2008") {
    lapply(x, function (x)
      as_tibble(rbind.fill(lcd(x, year = 2008))))
  } else if (fun == "200507_200914") {
    lapply(x, function (x)
      as_tibble(rbind.fill(lcd(x, year = 2005),
                           lcd(x, year = 2006),
                           lcd(x, year = 2007),
                           lcd(x, year = 2009),
                           lcd(x, year = 2010),
                           lcd(x, year = 2011),
                           lcd(x, year = 2012),
                           lcd(x, year = 2013),
                           lcd(x, year = 2014))))
  } else if (fun == "2005_2010") {
    lapply(x, function (x)
      as_tibble(rbind.fill(lcd(x, year = 2005),
                           lcd(x, year = 2006),
                           lcd(x, year = 2007),
                           lcd(x, year = 2009),
                           lcd(x, year = 2010))))
  } else if (fun == "2011_2014") {
    lapply(x, function (x)
      as_tibble(rbind.fill(lcd(x, year = 2011),
                           lcd(x, year = 2012),
                           lcd(x, year = 2013),
                           lcd(x, year = 2014))))
  } else {
    print("The station number or year is not valid")
  }
}

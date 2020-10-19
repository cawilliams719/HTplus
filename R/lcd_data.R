#' A Data Download Function for NOAA's LCD Stations
#' @description This function downloads meteorological station data from NOAA's Local Climatological Data (LCD). Additionally this function utilizes the `lcd` function from the `rnoaa` package. The purpose of this function is to create a tibble of station data over a 10 year period.
#' @param fun The function parameter must equal one of the following: "2005_2014", "2005", "2006_2014", "2008", "200507_200914", "2005_2010", and "2011_2014". These options determine the years of station data to be downloaded. If else, the function will not run. These parameters indicates that you wish to download LCD data for the specified years.
#' @param x x must equal a vector of LCD stations.
#' @details The function is designed to download data for the years 2005 to 2014 and years in between. Some LCD stations will have multiple numbers for a station depending on a year, thus this function is designed to be able to donwload data for a station in different chunks. Additionally, this code can be adapted to the user's data needs. The code iterates through a list of LCD stations to create a list of tibbles for each station for the 10 year period. For more information on the `lcd` function, please refer to the `rnoaa` package.
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

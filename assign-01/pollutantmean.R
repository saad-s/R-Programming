## Assign-01 Part 1
## Write a function named 'pollutantmean' 
## that calculates the mean of a pollutant (sulfate or nitrate) 
## across a specified list of monitors. 
## The function 'pollutantmean' takes three arguments: 
## 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers,
## 'pollutantmean' reads that monitors' particulate matter data 
## from the directory specified in the 'directory' argument 
## and returns the mean of the pollutant across all of the monitors, 
## ignoring any missing values coded as NA.
## 
## [SS] 
## 16-Jan-2015

pollutantmean <- function (directory, pollutant, id = 1:332) {
  
  # list all files in dir and filter those mentioned in id
  files <- list.files (directory, full.names = TRUE);
  files <- files[id];
  # create a new data frame to hold data from all ids 
  fdata <- data.frame ();
  for (file in files) {
    # read and bind data from files in data frame
    fdata <- rbind (fdata, read.csv (file));
    #fdata <- read.csv (file)[[pollutant]]
  }
  # extract pollutant data from files
  pdata <- fdata[[pollutant]];
  # calculate and return mean value of pollutant
  return (mean (pdata, na.rm = TRUE));
}

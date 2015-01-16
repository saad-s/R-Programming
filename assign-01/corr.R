## Write a function that takes a directory of data files and a 
## threshold for complete cases and calculates the correlation 
## between sulfate and nitrate for monitor locations where the 
## number of completely observed cases (on all variables) is 
## greater than the threshold. 
## The function should return a vector of correlations for the 
## monitors that meet the threshold requirement. 
## If no monitors meet the threshold requirement, 
## then the function should return a numeric vector of length 0.
##
## [SS]
## 16 Jan 2015

corr <- function (directory, threshold = 0) {
  
  # list all files in dir
  files <- list.files (directory, full.names = TRUE);
  # total number of files in dir
  n <- length(files);
  # create a numeric vector to hold all vals
  correl <- numeric();
  # run for all files in dir
  for (i in 1:n) {
    # read data from file
    fd <- read.csv (files[i]);
    # check NA and threshold condition
    if (sum (complete.cases (fd)) > threshold) {
      # remove NA cases
      fd <- fd[complete.cases (fd), ];
      correl <- c(correl, cor (fd$sulfate, fd$nitrate));
    }
  }
  
  return (correl)
}
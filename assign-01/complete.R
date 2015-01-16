## Write a function that reads a directory full of files and 
## reports the number of completely observed cases in each data file. 
## The function should return a data frame where the first column 
## is the name of the file and the second column is the number of 
## complete cases
## 
## [SS] 
## 16-Jan-2015 

complete <- function (directory, id = 1:332) {
  
  # list all files in dir and filter those mentioned in id
  files <- list.files (directory, full.names = TRUE);
  files <- files[id];
  # total number of files
  n <- length (files);
  # create a data frame of n size vectors for id and nobs 
  fdata <- data.frame (id = numeric (n), nobs = numeric (n));
  for (i in 1:n) {
    # update id column in ith row
    fdata$id[i] <- i;
    # read ith file and calculate all complete cases in file
    # update nobs column in ith row
    fdata$nobs[i] <- sum (complete.cases (read.csv (files[i])));
  }
  # return data frame
  return (fdata);
}
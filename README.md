getting-and-cleaning-data
=========================

Project for Getting and Cleaning Data

The initial data set contained a couple hundred variables and 10,299 observations of those variables.
I used a combination of cbind( ) and rbind( ) to merge the test,train,labels and features.
I changed all of the variable names to lower case using tolower(),got rid of white space, and changed 
variable values to be descriptive.

The variables were filtered to include only variables with 'std' or 'mean' somewhere in the variable name.
These variables could have been filtered even more, but I figured it was best to err on the side of caution
and just include every variable with those two words in it, rather than make a determination about which
mean and standard deviation variables were important and which ones were not.

I used dplyr package to get the data into a data frame table and group and summarize the data to get
a tidy data set of 180 observations and 88 variables.
# Exploratory Data Analysis - Week 1

# This code reads the dataset and selects only the relevant records. It then writes the subset 
# to a datafile from which it will be picked up by the various graphing scripts.

# Working Directory should be set to the directory of this R script.

# Read dataset and select only the relevant dates
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, 'data/household_power_consumption.zip', method = "curl") # may need to be auto on Windows
unzip('data/household_power_consumption.zip', exdir='data')

dataset_full <- read.csv('data/household_power_consumption.txt',sep=";",na.strings="?")
dataset <- dataset_full[dataset_full$Date %in% c("1/2/2007", "2/2/2007"),]
write.csv(dataset,'data/dataset_subset.csv')

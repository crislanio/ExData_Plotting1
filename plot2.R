# Exploratory Data Analysis - Week 1

# This code reads the dataset, selects only the relevant records and converts
# date/time. It writes the subset to a datafile from which it will be picked up
# by the various graphing scripts.

# Working Directory should be set to the directory of this R script.

# Read dataset and selec# Exploratory Data Analysis - Week 1

# Read truncated dataset. For reading in from URL and truncating of the original dataset, 
# see week1.R. The below code assumes there is a data subset in 'data/dataset_subset.csv' 
# as will be created by that script.
dataset <- read.csv('data/dataset_subset.csv')
dataset$datetime <- paste(dataset$Date, dataset$Time)
dataset$datetime <- strptime(dataset$datetime, "%d/%m/%Y %H:%M:%S")

# Working Directory should be set to the directory of this R script.

# To make sure the output is the same regardless of current locale
Sys.setlocale(locale="en_US.UTF-8")

# Plot 2
png("plot2.png", height=480, width=480)
plot(dataset$datetime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

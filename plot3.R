# Exploratory Data Analysis - Week 1

# Read truncated dataset. For reading in from URL and truncating of the original dataset, 
# see week1.R. The below code assumes there is a data subset in 'data/dataset_subset.csv' 
# as will be created by that script.
dataset <- read.csv('data/dataset_subset.csv')
dataset$datetime <- paste(dataset$Date, dataset$Time)
dataset$datetime <- strptime(dataset$datetime, "%d/%m/%Y %H:%M:%S")

# Working Directory should be set to the directory of this R script.

# To make sure the output is the same regardless of current locale
Sys.setlocale(locale="en_US.UTF-8")

# Plot 3
png("plot3.png", height=480, width=480)
with (dataset, {
  plot(datetime, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lwd=1)
})
dev.off()


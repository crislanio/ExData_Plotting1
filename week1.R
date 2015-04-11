# Exploratory Data Analysis - Week 1

# To make sure the output is the same regardless of current locale
Sys.setlocale(locale="en_US.UTF-8")

# Read dataset and select only the relevant dates, and convert dates and times
#dataset_full <- read.csv('data/household_power_consumption.txt',sep=";",na.strings="?")
#dataset <- dataset_full[dataset_full$Date %in% c("1/2/2007", "2/2/2007"),]
#write.csv(dataset,'data/dataset_subset.csv')

dataset <- read.csv('data/dataset_subset.csv')
dataset$datetime <- paste(dataset$Date, dataset$Time)
dataset$datetime <- strptime(dataset$datetime, "%d/%m/%Y %H:%M:%S")

# Plot 1
hist(dataset$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

# Plot 2
plot(dataset$datetime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Plot 3
with (dataset, {
  plot(datetime, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lwd=1)
})

# Plot 4
par(mfrow=c(2,2))
with (dataset, {
  plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(datetime, Voltage, type="l")
  plot(datetime, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lwd=1,bty="n")
  plot(datetime, Global_reactive_power, type="l")
})
par(mfrow=c(1,1))




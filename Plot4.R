## Fixing date format in file
Home$Date <- as.Date(Home$Date, format="%d/%m/%Y")
## Subsetting to select for only dates of interest
TestData <-subset(Home, Date=="2007-02-01" | Date=="2007-02-02")
## Converting date/times
DateTime <- paste(as.Date(TestData$Date), TestData$Time)
TestData$DateTime <- as.POSIXct(DateTime)
## Setting global paramaters
par(mfrow=c(2,2))
##Creating plots
plot(TestData$Global_active_power~TestData$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(TestData$Voltage~TestData$DateTime, type="l", ylab="Voltage", xlab="datetime")
plot(TestData$Sub_metering_1~TestData$DateTime, type="l", ylab="Energy Sub Metering", xlab="")
lines(TestData$Sub_metering_2~TestData$DateTime, col="red")
lines(TestData$Sub_metering_3~TestData$DateTime, col="blue")
plot(TestData$Global_reactive_power~TestData$DateTime, type="l", ylab="Global_reactive_power", xlab="datetime")
##Creating png file of histogram
dev.copy(png, file="plot4.png")
dev.off()
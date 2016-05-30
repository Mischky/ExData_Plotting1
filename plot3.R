## Step one: Read txt file into R. Specify several arguments including sep, na.strings etc
Home <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE) 
## Fixing date format in file
Home$Date <- as.Date(Home$Date, format="%d/%m/%Y")
## Subsetting to select for only dates of interest
TestData <-subset(Home, Date=="2007-02-01" | Date=="2007-02-02")
## Converting date/times
DateTime <- paste(as.Date(TestData$Date), TestData$Time)
TestData$DateTime <- as.POSIXct(DateTime)
##Creating plot
plot(TestData$Sub_metering_1~TestData$DateTime, type="l", ylab="Energy Sub Metering", xlab="")
lines(TestData$Sub_metering_2~TestData$DateTime, col="red")
lines(TestData$Sub_metering_3~TestData$DateTime, col="blue")
##Adding legend
legend("topright", legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), cex = .5)
##Creating png file of histogram
dev.copy(png, file="plot3.png")
dev.off()
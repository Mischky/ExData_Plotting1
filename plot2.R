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
plot(TestData$Global_active_power~TestData$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
##Creating png file of histogram
dev.copy(png, file="plot2.png")
dev.off()
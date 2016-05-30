## Step one: Read txt file into R. Specify several arguments including sep, na.strings etc
Home <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE) 
## Fixing date format in file
Home$Date <- as.Date(Home$Date, format="%d/%m/%Y")
## Subsetting to select for only dates of interest
TestData <-subset(Home, Date=="2007-02-01" | Date=="2007-02-02")
##Creating histogram
hist(TestData$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
##Creating png file of histogram
dev.copy(png, file="plot1.png")
dev.off()
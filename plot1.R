
#Downloading, unzipping and reading into R the file "household_power_consumption"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "ElectricPowerConsumption.rar")
unzip("ElectricPowerConsumption.rar")
ElectricPC <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

#Subsetting data to dates 01/02/2007 and 02/02/2007
electricityDateRange <- subset(ElectricPC, ((Date == "1/2/2007") | (Date == "2/2/2007")))

#plot1
png(file = "plot1.png")
par(bg = "transparent")
hist(electricityDateRange$Global_active_power, col = "red", breaks = 15, ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", bg = "transparent")
dev.off()
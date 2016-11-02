
#Downloading, unzipping and reading into R the file "household_power_consumption"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "ElectricPowerConsumption.rar")
unzip("ElectricPowerConsumption.rar")
ElectricPC <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

#Subsetting data to dates 01/02/2007 and 02/02/2007
electricityDateRange <- subset(ElectricPC, ((Date == "1/2/2007") | (Date == "2/2/2007")))

#Creating new variable with a Date/Time object
electricityDateRange[,10] <- as.POSIXct(strptime(paste(electricityDateRange[,1], electricityDateRange[,2], sep= " "),  "%d/%m/%Y %H:%M:%S"))

#plot3
png(file = "plot3.png")
par(bg = "transparent")
plot(electricityDateRange[,10], electricityDateRange$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "", col = "black", ylim = c(0,40))
plot(electricityDateRange[,10], electricityDateRange$Sub_metering_2, type = "n", ylab = "Energy sub metering", xlab = "", col = "red", ylim = c(0,40))
plot(electricityDateRange[,10], electricityDateRange$Sub_metering_3, type = "n", ylab = "Energy sub metering", xlab = "", col = "blue", ylim = c(0,40))
lines(electricityDateRange[,10], electricityDateRange$Sub_metering_1, col = "black")
lines(electricityDateRange[,10], electricityDateRange$Sub_metering_2, col = "red")
lines(electricityDateRange[,10], electricityDateRange$Sub_metering_3, col = "blue")
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

#Downloading, unzipping and reading into R the file "household_power_consumption"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "ElectricPowerConsumption.rar")
unzip("ElectricPowerConsumption.rar")
ElectricPC <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

#Subsetting data to dates 01/02/2007 and 02/02/2007
electricityDateRange <- subset(ElectricPC, ((Date == "1/2/2007") | (Date == "2/2/2007")))

#Creating new variable with a Date/Time object
electricityDateRange[,10] <- as.POSIXct(strptime(paste(electricityDateRange[,1], electricityDateRange[,2], sep= " "),  "%d/%m/%Y %H:%M:%S"))

#plot4
png(file = "plot4.png")
par(bg = "transparent", mfrow = c(2,2))

#Plot[1,1]
plot(electricityDateRange[,10], electricityDateRange$Global_active_power, type = "n", ylab = "Global Active Power", xlab = "", col = "black")
lines(electricityDateRange[,10], electricityDateRange$Global_active_power, col = "black")

#Plot[1,2]

plot(electricityDateRange[,10], electricityDateRange$Voltage, type = "n", ylab = "Voltage", xlab = "datetime", col = "black")
lines(electricityDateRange[,10], electricityDateRange$Voltage, col = "black")

#Plot[2,1]
plot(electricityDateRange[,10], electricityDateRange$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "", col = "black", ylim = c(0,40))
points(electricityDateRange[,10], electricityDateRange$Sub_metering_2, type = "n", ylab = "Energy sub metering", xlab = "", col = "red", ylim = c(0,40))
points(electricityDateRange[,10], electricityDateRange$Sub_metering_3, type = "n", ylab = "Energy sub metering", xlab = "", col = "blue", ylim = c(0,40))
lines(electricityDateRange[,10], electricityDateRange$Sub_metering_1, col = "black")
lines(electricityDateRange[,10], electricityDateRange$Sub_metering_2, col = "red")
lines(electricityDateRange[,10], electricityDateRange$Sub_metering_3, col = "blue")
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#Plot[2,2]

plot(electricityDateRange[,10], electricityDateRange$Global_reactive_power, ylab = "Global_reactive_power", type = "n", xlab = "datetime", col = "black")
lines(electricityDateRange[,10], electricityDateRange$Global_reactive_power, col = "black")

dev.off()

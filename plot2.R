
#Downloading, unzipping and reading into R the file "household_power_consumption"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "ElectricPowerConsumption.rar")
unzip("ElectricPowerConsumption.rar")
ElectricPC <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

#Subsetting data to dates 01/02/2007 and 02/02/2007
electricityDateRange <- subset(ElectricPC, ((Date == "1/2/2007") | (Date == "2/2/2007")))

#Creating new variable with a Date/Time object
electricityDateRange[,10] <- as.POSIXct(strptime(paste(electricityDateRange[,1], electricityDateRange[,2], sep= " "),  "%d/%m/%Y %H:%M:%S"))

#plot2
png(file = "plot2.png")
par(bg = "transparent")
plot(electricityDateRange[,10], electricityDateRange$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "", col = "black")
lines(electricityDateRange[,10], electricityDateRange$Global_active_power, col = "black")
dev.off()
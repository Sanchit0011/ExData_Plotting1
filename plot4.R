#Downloading zip file which contains the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "C:/R/Household_Power_Consumption.zip")

#Unzipping the zip file and extracting it
unzip(zipfile = "C:/R/Household_Power_Consumption.zip", exdir = "C:/R")

#Reading data into R
HPCData <- read.table("C:/R/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#Subsetting the data to include household power consumption between 2007-02-01 and 2007-02-02
HPCData <- subset(HPCData, Date %in% c("1/2/2007", "2/2/2007"))

#Creating new variable DateTime
HPCData$DateTime <- strptime(paste(HPCData$Date, HPCData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Creating png file
png(file = "plot4.png", height = 480, width = 480)
 
#Creating plot
par(mfrow = c(2,2))
plot(HPCData$DateTime, as.numeric(HPCData$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(HPCData$DateTime, as.numeric(HPCData$Voltage), type = "l", ylab = "Voltage", xlab = "datetime")
plot(HPCData$DateTime, HPCData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "") 
lines(HPCData$DateTime, HPCData$Sub_metering_2, col = "Red")
lines(HPCData$DateTime, HPCData$Sub_metering_3, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(HPCData$DateTime, as.numeric(HPCData$Global_reactive_power), type = "l", ylab = "Global_reactive_power", xlab = "datetime")

#CLosing graphics device
dev.off()

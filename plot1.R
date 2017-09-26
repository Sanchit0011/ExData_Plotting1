#Downloading zip file which contains the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "C:/R/Household_Power_Consumption.zip")

#Unzipping the zip file and extracting it
unzip(zipfile = "C:/R/Household_Power_Consumption.zip", exdir = "C:/R")

#Reading data into R
HPCData <- read.table("C:/R/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#Subsetting the data to include household power consumption between 2007-02-01 and 2007-02-02
HPCData <- subset(HPCData, Date %in% c("1/2/2007", "2/2/2007"))

#Creating png file with height of 480 and width of 480
png(file = "plot1.png", height = 480, width = 480)

#Creating histogram for global active power  
hist(as.numeric(HPCData$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Closing graphic device
dev.off()









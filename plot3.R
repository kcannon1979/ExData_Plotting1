setwd("C:/Users/Ken/Google Drive/Coursera - Data Science - 4-Exploratory Data Analysis/Course Project 1")
library(lubridate)

#Read URL, download file, unzip file, read delimited file into R, and subset based on
#two dates of interest.
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url1, "./household_power_consumption.zip")
unzip("./household_power_consumption.zip")
file1 <- read.delim("./household_power_consumption.txt", header = TRUE,
                    sep = ";", nrows = 2075260, stringsAsFactors = FALSE)
file1 <- file1[file1$Date == "1/2/2007" | file1$Date == "2/2/2007",]
gc()

#Format date as such and format Global Active Power variable as numeric.
file1$Date <- as.Date(file1$Date, format = "%d/%m/%Y")
file1$Datetime <- paste(file1$Date, file1$Time)
file1$Datetime <- strptime(file1$Datetime, format = "%Y-%m-%d %H:%M:%S")
file1$Global_active_power <- as.numeric(file1$Global_active_power, digits = 4)
file1$Sub_metering_1 <- as.numeric(file1$Sub_metering_1, digits = 4)
file1$Sub_metering_2 <- as.numeric(file1$Sub_metering_2, digits = 4)
file1$Sub_metering_3 <- as.numeric(file1$Sub_metering_3, digits = 4)

png("plot3.png", width = 480, height = 480)
plot(file1$Datetime, file1$Sub_metering_1, pch = ".", xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")
lines(file1$Datetime, file1$Sub_metering_2, col = "red", type = "l")
lines(file1$Datetime, file1$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
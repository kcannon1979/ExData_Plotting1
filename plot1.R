setwd("C:/Users/Ken/Google Drive/Coursera - Data Science - 4-Exploratory Data Analysis/Course Project 1")
library(dplyr)

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
file1$Global_active_power <- as.numeric(file1$Global_active_power, digits = 4)

#Create plot file, write histogram to file, and close file.
png("plot1.png", width = 480, height = 480)
hist1 <- hist(file1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

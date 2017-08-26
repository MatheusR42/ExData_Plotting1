library(dplyr)
library(lubridate)

if(!file.exists("data.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data.zip", method = "curl")
}

if(!file.exists("household_power_consumption.txt")){
    unzip("data.zip")
}

powerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

powerConsumption <- mutate(powerConsumption, formatedDate = dmy(Date))

powerConsumption <- filter(powerConsumption, formatedDate == dmy("01/02/2007") | formatedDate == dmy("02/02/2007"))

png("plot1.png", width = 480, height = 480)

hist(powerConsumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
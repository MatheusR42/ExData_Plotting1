library(dplyr)
library(lubridate)

if(!file.exists("data.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data.zip", method = "curl")
}

if(!file.exists("household_power_consumption.txt")){
    unzip("data.zip")
}

powerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

powerConsumption <- mutate(powerConsumption, formatedDate = dmy_hms( paste0(Date,"-",Time) ) )

powerConsumption <- filter(powerConsumption, formatedDate >= dmy_hms("01/02/2007 00:00:00"), formatedDate <= dmy_hms("03/02/2007 00:00:00"))

powerConsumption <- mutate(powerConsumption, weekDay = wday(formatedDate, label = TRUE) )

png("plot2.png", width = 480, height = 480)

plot(powerConsumption$Global_active_power ~ powerConsumption$formatedDate, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()

library(dplyr)
library(lubridate)

if(!file.exists("data.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data.zip", method = "curl")
}

if(!file.exists("household_power_consumption.txt")){
    unzip("data.zip")
}

pwConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

pwConsumption <- mutate(pwConsumption, formatDate = dmy(Date))

pwConsumption <- filter(pwConsumption, formatDate == dmy("01/02/2007") | formatDate == dmy("02/02/2007"))

View(pwConsumption)

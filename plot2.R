library(dplyr)
library(lubridate)

temp <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
dt <- subset(temp, Date %in% c("1/2/2007","2/2/2007"))
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
DateTime <- paste(dt$Date, dt$Time)
dt$DateTime <- as.POSIXct(DateTime)

par(mfrow=c(1,1))
with(dt, plot(Global_active_power ~ DateTime,
              type = 'l',
              xlab = '',
              ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
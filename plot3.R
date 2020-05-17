library(dplyr)
library(lubridate)

temp <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
dt <- subset(temp, Date %in% c("1/2/2007","2/2/2007"))
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
DateTime <- paste(dt$Date, dt$Time)
dt$DateTime <- as.POSIXct(DateTime)

par(mfrow=c(1,1))

with(dt,{ plot(Sub_metering_1 ~ DateTime,
               col = "black",
              type = 'l',
              xlab = '',
              ylab = "Energy Sub Metering")
    lines(Sub_metering_2 ~ DateTime,
         col = "red")
    lines(Sub_metering_3 ~ DateTime,
         col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        })

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
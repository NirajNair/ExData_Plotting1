library(dplyr)
temp <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
dt <- subset(temp, Date %in% c("1/2/2007","2/2/2007"))
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

par(mfrow=c(1,1))

hist(dt$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
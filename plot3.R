setwd("~/priya/DataScience- Courseera/workstation/explodata")

# Plot 3

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
Sys.setlocale("LC_TIME", "C")
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$datetime <- as.POSIXct(paste(data1$Date, data1$Time))
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
data1$Sub_metering_1 <- as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 <- as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3 <- as.numeric(as.character(data1$Sub_metering_3))

dev.copy(png, file="plot3.png", height=480, width=480)
plot(data1$datetime,data1$Sub_metering_1, xlab="",ylab="Energy Sub Metering",type="l")
lines(data1$datetime, data1$Sub_metering_2, col = 'Red')
lines(data1$datetime, data1$Sub_metering_3, col = 'Blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
dev.off()


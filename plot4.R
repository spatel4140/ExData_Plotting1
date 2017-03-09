hpc <- read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE)
hpc <- subset(hpc, hpc$Date %in% c("2/1/2007", "2/2/2007"))
dateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%m/%d/%Y %H:%M:%S")

png(file="plot4.png")
par(mfcol=c(2, 2))
plot(dateTime, 
     as.numeric(hpc$Global_active_power)/1000, 
     type='l', 
     ylab="Global Active Power", 
     xlab = "")

plot(dateTime, 
     hpc$Sub_metering_1, 
     type = 'l', 
     col = "black", 
     ylim = c(0, 30), 
     ylab = "Energy sub metering",
     xlab = "")
lines(dateTime, hpc$Sub_metering_2, type = 'l', col = "red")
lines(dateTime, hpc$Sub_metering_3, type = 'l', col = "blue")
legend("topright", 
       pch = "-", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1,
       box.lwd = 0)

plot(dateTime, as.numeric(hpc$Voltage)/10, xlab="datetime", ylab = "Voltage", type='l')

plot(dateTime, 
     as.numeric(hpc$Global_reactive_power)/1000, 
     xlab="datetime", 
     ylab = "Global_reactive_power", 
     type='l')
dev.off()
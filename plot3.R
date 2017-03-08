hpc <- read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE)
hpc <- subset(hpc, hpc$Date %in% c("2/1/2007", "2/2/2007"))
dateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%m/%d/%Y %H:%M:%S")

png(file="figure/plot3.png")
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
       lwd = 1)
dev.off()

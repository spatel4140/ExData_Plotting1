hpc <- read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE)
hpc <- subset(hpc, hpc$Date %in% c("2/1/2007", "2/2/2007"))
dateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%m/%d/%Y %H:%M:%S")

png(file="plot2.png")
plot(dateTime, 
     as.numeric(hpc$Global_active_power)/300, 
     type='l', 
     ylab="Global Active Power (kilowatts)", 
     xlab = "")
dev.off()

hpc <- read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE)
hpc <- subset(hpc, hpc$Date %in% c("2/1/2007", "2/2/2007"))

png(file="plot1.png")
hist(as.numeric(hpc$Global_active_power)/100, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     xlim = c(0, 6), 
     breaks = 64)
dev.off()

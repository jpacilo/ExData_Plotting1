---
# PLOT #3
# Global Active Power Sub Metering
# Author: jpacilo

library(data.table)
library(dplyr)

pow <- fread(input = "household_power_consumption.txt", sep = ";") %>% 
       mutate(Date_Time = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>%
       filter((Date_Time >= "2007-02-01") & (Date_Time < "2007-02-03")) %>%
       mutate(Global_active_power = as.numeric(Global_active_power))

png("plot3.png", width = 480, height = 480)

plot(pow$Date_Time, pow$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(pow$Date_Time, pow$Sub_metering_2, col = "red")
lines(pow$Date_Time, pow$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1), lwd = c(1, 1))

dev.off()

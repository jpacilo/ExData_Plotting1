---
# PLOT #4
# Global Active Power Sub Metering       

library(data.table)
library(dplyr)

pow <- fread(input = "household_power_consumption.txt", sep = ";") %>% 
        mutate(Date_Time = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>%
        filter((Date_Time >= "2007-02-01") & (Date_Time < "2007-02-03")) %>%
        mutate(Global_active_power = as.numeric(Global_active_power))

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(pow$Date_Time, pow$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

plot(pow$Date_Time, pow$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(pow$Date_Time, pow$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")

lines(pow$Date_Time, pow$Sub_metering_2, col = "red")
lines(pow$Date_Time, pow$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"), 
       c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "),
       lty = c(1, 1),
       bty = "n",
       cex = 0.5) 

plot(pow$Date_Time, pow$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reaactive_power")

dev.off()

---
        
        
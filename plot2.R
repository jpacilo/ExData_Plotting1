---
# PLOT #2
# Global Active Power Time Series
        
library(data.table)
library(dplyr)

pow <- fread(input = "household_power_consumption.txt", sep = ";") %>% 
       mutate(Date_Time = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>%
       filter((Date_Time >= "2007-02-01") & (Date_Time < "2007-02-03")) %>%
       mutate(Global_active_power = as.numeric(Global_active_power))
       
png("plot2.png", width = 480, height = 480)

plot(x = pow$Date_Time, y = pow$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

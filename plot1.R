---

# PLOT #1
# Global Active Power Histogram
# Author: jpacilo
        
library(data.table)
library(dplyr)

pow <- fread(input = "household_power_consumption.txt", sep = ";") %>% 
       mutate(Date = as.Date(Date, "%d/%m/%Y")) %>% 
       filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>% 
       mutate(Global_active_power = as.numeric(Global_active_power))

png("plot1.png", width=480, height=480)

hist(pow$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "Red")

dev.off()

setwd("G:/amudhan/Coursera/Exp")

 hp<-read.table('household_power_consumption.txt', header = TRUE, sep=';',na.strings="?")
 hp$Date = as.Date(hp$Date,'%d/%m/%Y')
 df<-subset(hp,(Date=='2007-02-01' | Date =='2007-02-02'))
 df$Date <- as.Date(df$Date , "%d/%m/%Y")
 df$Time <- paste(df$Date, df$Time, sep=" ")
 df$Time <- strptime(df$Time, "%Y-%m-%d %H:%M:%S")
 par(mfrow = c(2, 2))
 with(df, {
         plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
         
         plot(Time, Voltage, xlab = "datetime", type = "l", ylab = "Voltage")
         
         ylimits = range(c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3))
         plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")
         
         par(new = TRUE)
         plot(Time, Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")
         par(new = TRUE)
         plot(Time, Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")
         legend("topright",
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                bg = "transparent",
                bty = "n",
                lty = c(1,1,1),
                col = c("black", "red", "blue"),cex=0.6,
         )
         
         plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
         
 })
 

setwd("G:/amudhan/Coursera/Exp")


hp<-read.table('household_power_consumption.txt', header = TRUE, sep=';',na.strings="?")

hp$Date = as.Date(hp$Date,'%d/%m/%Y')
hp<-subset(hp,(Date=='2007-02-01' | Date =='2007-02-02'))
names(hp)
unique(hp$Date) 

hp$Time <- paste(hp$Date, hp$Time, sep=" ")

hp$Time <- strptime(hp$Time, "%Y-%m-%d %H:%M:%S")



ylimits = range(c(hp$Sub_metering_1, hp$Sub_metering_2, hp$Sub_metering_3))

plot(hp$Time, hp$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", 
     ylim = ylimits, col = "black",cex=0.8, cex.axis = 0.8)

par(new = TRUE)

plot(hp$Time, hp$Sub_metering_2, xlab = "", axes = FALSE, 
     ylab = "", type = "l", ylim = ylimits, col = "red", cex=0.8)
par(new = TRUE)
plot(hp$Time, hp$Sub_metering_3, xlab = "", axes = FALSE, 
     ylab = "", type = "l", ylim = ylimits, col = "blue",cex=0.8)


legend("topright",
       legend =  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       #bg = "transparent",
      # bty = "n",
       lty = 1,
       cex=0.6, 
       xjust=0 , 
       col = c("black", "red", "blue")
)

dev.copy(png, file = "./plot3.png", width=480, height=480) 
dev.off() 

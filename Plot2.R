setwd("G:/amudhan/Coursera/Exp")

hp<-read.table('household_power_consumption.txt', header = TRUE, sep=';',na.strings="?")

hp$Date = as.Date(hp$Date,'%d/%m/%Y')
hp<-subset(hp,(Date=='2007-02-01' | Date =='2007-02-02'))
names(hp)
unique(hp$Date) 

hp$Time <- paste(hp$Date, hp$Time, sep=" ")

hp$Time <- strptime(hp$Time, "%Y-%m-%d %H:%M:%S")


plot(hp$Time, hp$Global_active_power, type="l", main="",xlab="" ,
     ylab="Global Active Power(kilowatts)")

dev.copy(png, file = "./plot2.png", width=480, height=480) 
dev.off()
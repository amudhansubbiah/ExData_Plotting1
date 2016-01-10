setwd("G:/amudhan/Coursera/Exp")
 hpwr<-read.table('household_power_consumption.txt', header = TRUE, sep=';',na.strings="?")
 hpwr$Date = as.Date(hpwr$Date,'%d/%m/%Y')
 df<-subset(hpwr,(Date=='2007-02-01' | Date =='2007-02-02'))
  
 
  hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="red")
 dev.copy(png, file = "./plot1.png", width=480, height=480) 
 
 dev.off()

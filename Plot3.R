data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Plot3data1<-as.numeric(Datasubset$Sub_metering_1)
Plot3data2<-as.numeric(Datasubset$Sub_metering_2)
Plot3data3<-as.numeric(Datasubset$Sub_metering_3)
                                    
Plot3date <- strptime(paste(Datasubset$Date, Datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")




png("plot3.png", )
plot(Plot3date,Plot3data1 ,type="l",ylab="Energy Sub Metering(kilowatts)",xlab="")
lines(Plot3date,Plot3data2,type="l",col="red")
lines(Plot3date,Plot3data3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1, lwd=2.5) 
       
dev.off()

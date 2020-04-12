data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

activepower <- as.numeric(Datasubset$Global_active_power)
voltage<-as.numeric(Datasubset$Voltage)
meter1<-as.numeric(Datasubset$Sub_metering_1)
meter2<-as.numeric(Datasubset$Sub_metering_2)
meter3<-as.numeric(Datasubset$Sub_metering_3)
reactivepower <-as.numeric(Datasubset$Global_reactive_power)

datetime <- strptime(paste(Datasubset$Date, Datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")




png("plot4.png", )
par(mfrow=c(2,2))

plot(datetime,activepower, type="l",ylab="Global Active Power",xlab="")

plot(datetime,voltage, type="l",ylab="Voltage")

plot(datetime,meter1 ,type="l",ylab="Energy Sub Metering",xlab="")
lines(datetime,meter2,type="l",col="red")
lines(datetime,meter3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1, lwd=2.5) 

plot(datetime,reactivepower, type="l",ylab="Global_reactive_power")

dev.off()

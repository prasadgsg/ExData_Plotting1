data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Plot2data <- as.numeric(Datasubset$Global_active_power)
Plot2date <- strptime(paste(Datasubset$Date, Datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
 
png("plot2.png", )
plot(Plot2date,Plot2data ,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()




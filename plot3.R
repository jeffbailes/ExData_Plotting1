data <- read.csv("household_power_consumption.txt", sep=";",na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
start.Date <- as.Date("2007-02-01")
end.Date <- as.Date("2007-02-02")
include.obs <- (data$Date >= start.Date) & (data$Date <= end.Date)
observations <- data[include.obs,]
times <- strptime(paste(observations$Date, observations$Time), format="%Y-%m-%d %H:%M:%S")
thisData <- data[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")]
png('plot3.png', width=480, height=480)
plot(times, observations$Sub_metering_1, type='l',col='black', ylab="Energy sub metering")
lines(times, observations$Sub_metering_2, col='red')
lines(times, observations$Sub_metering_3, col='blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c('black','red','blue'))
dev.off()

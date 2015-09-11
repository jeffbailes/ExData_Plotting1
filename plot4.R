data <- read.csv("household_power_consumption.txt", sep=";",na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
start.Date <- as.Date("2007-02-01")
end.Date <- as.Date("2007-02-02")
include.obs <- (data$Date >= start.Date) & (data$Date <= end.Date)
observations <- data[include.obs,]
times <- strptime(paste(observations$Date, observations$Time), format="%Y-%m-%d %H:%M:%S")
png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))
plot(times,observations$Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab="")

plot(times,observations$Voltage, type='l', ylab="Voltage", xlab="datetime")

plot(times, observations$Sub_metering_1, type='l',col='black', ylab="Energy sub metering")
lines(times, observations$Sub_metering_2, col='red')
lines(times, observations$Sub_metering_3, col='blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c('black','red','blue'),bty='n')

plot(times,observations$Global_reactive_power, type='l', ylab="Global_reactive_power", xlab="datetime")
dev.off()
# Read in the data and filter out by date.
data <- read.csv("household_power_consumption.txt", sep=";",na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
start.Date <- as.Date("2007-02-01")
end.Date <- as.Date("2007-02-02")
include.obs <- (data$Date >= start.Date) & (data$Date <= end.Date)
observations <- data[include.obs,]
# Convert the dates and times into full on date objects.
times <- strptime(paste(observations$Date, observations$Time), format="%Y-%m-%d %H:%M:%S")
# Plot the line graph.
png('plot2.png', width=480, height=480)
plot(times,
     observations[,"Global_active_power"],
     type='l',
     ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()

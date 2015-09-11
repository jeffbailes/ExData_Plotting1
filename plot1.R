# Read in data.
data <- read.csv("household_power_consumption.txt", sep=";",na.strings="?")
# Mess with the dates, filter out the ones we don't want.
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
start.Date <- as.Date("2007-02-01")
end.Date <- as.Date("2007-02-02")
include.obs <- (data$Date >= start.Date) & (data$Date <= end.Date)
observations <- data[include.obs,]
# Get the global active power data, then plot as a histogram.
png('plot1.png', width=480, height=480)
hist(observations[,"Global_active_power"],
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()

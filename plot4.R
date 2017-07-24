## Read the data form the txt file and use the headers from the file
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?")

## Make a POSIXlt class by combining Date and Time
DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Combine the POSIXct DateTime vector with the data.frame
data2 <- cbind(DateTime, data)

## Select a subset of the data.frame by using the dates 2007-02-01 and 2007-02-01
dataset <- na.omit(subset(data2, DateTime >= "2007-02-01 00:00:00" & DateTime < "2007-02-03 00:00:00"))

## make a frame of 2x2 plots to fill you plots
par(mfcol = c(2, 2))

## Plot the Global active power data in time, including the labels top left
plot4.1 <- plot(dataset$DateTime, dataset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", lty = 1)

## Plot the sub_metering data, including the labels at the bottom left
plot4.2 <- plot(dataset$DateTime, dataset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", lty = 1)
points(dataset$DateTime, dataset$Sub_metering_2, type = "l", col = "red", lty = 1)
points(dataset$DateTime, dataset$Sub_metering_3, type = "l", col = "blue", lty = 1)
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.width = strwidth("       Sub_metering_1      "))

## Plot the Voltage data in time at the top right
plot4.3 <- plot(dataset$DateTime, dataset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", lty = 1)

## Plot the Reactive power data in time at the bottom right
plot4.4 <- plot(dataset$DateTime, dataset$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", lty = 1)

## Save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
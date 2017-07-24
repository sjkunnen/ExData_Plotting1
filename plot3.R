## Read the data form the txt file and use the headers from the file
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?")

## Make a POSIXlt class by combining Date and Time
DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Combine the POSIXct DateTime vector with the data.frame
data2 <- cbind(DateTime, data)

## Select a subset of the data.frame by using the dates 2007-02-01 and 2007-02-01
dataset <- na.omit(subset(data2, DateTime >= "2007-02-01 00:00:00" & DateTime < "2007-02-03 00:00:00"))

## Plot the Submetering data in time, including the labels
plot3 <- plot(dataset$DateTime, dataset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", lty = 1)
points(dataset$DateTime, dataset$Sub_metering_2, type = "l", col = "red", lty = 1)
points(dataset$DateTime, dataset$Sub_metering_3, type = "l", col = "blue", lty = 1)
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.width = strwidth("       Sub_metering_1      "))

## Save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
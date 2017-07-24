## Read the data form the txt file and use the headers from the file
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?")

## Make a POSIXlt class by combining Date and Time
DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Combine the POSIXct DateTime vector with the data.frame
data2 <- cbind(DateTime, data)

## Select a subset of the data.frame by using the dates 2007-02-01 and 2007-02-01
dataset <- na.omit(subset(data2, DateTime >= "2007-02-01 00:00:00" & DateTime < "2007-02-03 00:00:00"))

## Plot the Global active power data in time, including the labels
plot2 <- plot(dataset$DateTime, dataset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", lty = 1)

## Save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
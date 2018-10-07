##Plot 3

#reading data into table
power <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

#setting d-m-y position in date
power$Date <- as.Date(power$Date, "%d/%m/%Y")

#eliminating missing values
power <- power[complete.cases(power),]

#subset 1 & 2 of feb 2007
subset <- subset(power, Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2"))

#creating new combined date & Time column in subset
subset$date_time <- paste(subset$Date, subset$Time)

#Turning date time column into posixct format
subset$date_time <- as.POSIXct(strptime(subset$date_time, "%Y-%m-%d %H:%M:%S"))

#plotting plot 3
plot(subset$Sub_metering_1~subset$date_time, type= "l", ylab="Global Active Power (kilowatts)", xlab="")
lines(subset$Sub_metering_2~subset$date_time, col="red")
lines(subset$Sub_metering_3~subset$date_time, col="blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1, 1, 1), cex=0.75)

#Saving to file in png 480x480
dev.copy(png, "plot3.png",height=480, width=480)
dev.off()

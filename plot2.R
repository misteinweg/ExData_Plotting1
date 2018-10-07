##Plot 2

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

#plotting plot 2
plot(subset$date_time, subset$Global_active_power, type= "l", ylab="Global Active Power (kilowatts)", xlab="")

#Saving to file in png 480x480
dev.copy(png, "plot2.png", height=480, width=480)
dev.off()
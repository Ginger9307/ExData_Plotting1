# Exploratory Data Analisys. Course Project week 1
# Plot 4. Set of 4 Plots
#############################################################################################

################ 1.DOWNLOAD DATA ############################################################
# download file
url0 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = url0, destfile = 'household_power_consumption.zip', method = 'curl')

# unzip file
unzip(zipfile = 'household_power_consumption.zip')

# read file
data <- read.csv('household_power_consumption.txt',   sep = ";", stringsAsFactors = FALSE, na.strings = "?")

################ 2.PRAPARATION OF DATA ######################################################
# subset of data by two dates
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# convert vars to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)

# convert the Date and Time variables to Date/Time clases => new column
data$Date_time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")

############### 3.CREATE PLOTS AND SAVE IT TO A FILE #######################################
# open graphics device PNG, file 480x480 
png(file = "plot4.png", width = 480, height = 480, units = "px")

# set parameters for 4 plots in 2 rows
par(mfrow = c(2,2))

# plot 1. Global active power
with(data, plot(Date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# plot 2. Voltage
with(data, plot(Date_time, Voltage, type = "l"))

# plot 3. Energy sub metering
with(data, plot(Date_time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(data, lines(Date_time, Sub_metering_1, col = "black"))
with(data, lines(Date_time, Sub_metering_2, col = "red"))
with(data, lines(Date_time, Sub_metering_3, col = "blue"))
legend("topright", pch = "_", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 4. Global reactive power
with(data, plot(Date_time, Global_reactive_power, type = "l"))

# close device
dev.off()

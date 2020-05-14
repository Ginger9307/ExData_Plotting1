# Exploratory Data Analisys. Course Project week 1
# Plot 3. Plot of Sub_ meterings 1/2/3 
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

# convert vars Sub_metering_1/2/3 to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# convert the Date and Time variables to Date/Time clases
data$Date_time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")

############### 3.CREATE PLOT AND SAVE IT TO A FILE #######################################
# open graphics device PNG, file 480x480 
png(file = "plot3.png", width = 480, height = 480, units = "px")

with(data, plot(Date_time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(data, lines(Date_time, Sub_metering_1, col = "black"))
with(data, lines(Date_time, Sub_metering_2, col = "red"))
with(data, lines(Date_time, Sub_metering_3, col = "blue"))
legend("topright", pch = "_", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close device
dev.off()

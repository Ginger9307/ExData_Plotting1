# Exploratory Data Analisys. Course Project week 1
# Plot 1. Histogram of Global active power
###########################################################################################

################ 1.DOWNLOAD DATA############################################################
# download file
url0 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = url0, destfile = 'household_power_consumption.zip', method = 'curl')

# unzip file
unzip(zipfile = 'household_power_consumption.zip')

# read file
data<- read.csv('household_power_consumption.txt', sep = ";", stringsAsFactors = FALSE, na.strings = "?")

################ 2.PRAPARATION OF DATA ####################################################
# convert Date variable to Date clase

data$Date <- strptime(data$Date, format = "%d/%m/%Y")

# subset the period 01.02.2007 - 02.02.2007
data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# convert Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

############### 3.CREATE A PLOT AND SAVE IT TO A FILE #######################################
# open graphics device PNG, file 480x480 
png(file = "plot1.png", width = 480, height = 480, units = "px")

# create histogram
hist(x = data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# close device
dev.off()
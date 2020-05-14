# Exploratory Data Analisys. Course Project week 1
# Plot 2. Plot of Global active power 
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

# convert the Date and Time variables to Date/Time clases
data$Date_time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")

# convert var Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

############### 3.CREATE PLOT AND SAVE IT TO A FILE #######################################
# open graphics device PNG, file 480x480 
png(file = "plot2.png", width = 480, height = 480, units = "px")

# create plot
with(data,{
    plot(x = Date_time, y = Global_active_power, type = "l",    # z,y and type of plot (line)
    xlab = "", ylab = "Global activity power (kilowatts)")      # axes labels
})   

# close device
dev.off()
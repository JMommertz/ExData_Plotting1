        setwd("~/Desktop/Coursera/Exploratory Data Analysis/Week 1/Course Project")

        # create a png file
        png("plot1.png", width = 480, height = 480)
        
        # read only the relevant rows of the data
        df <- read.table((pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')),colClasses = "character", sep = ";")
       
        # insert the right names of the columns
        colnames(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       
        # some helpful formatting 
        df2 <- as.Date(df$Date, format = "%d/%m/%Y")
        df$Date <- df2
        df2 <- as.numeric(df$Global_active_power)
        df$Global_active_power <- df2

        # making Plot1
        hist(df$Global_active_power, font.main = 2, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
        
        # shut down the device
        dev.off()
        setwd("~/Desktop/Coursera/Exploratory Data Analysis/Week 1/Course Project")

        # create a png file
        png("plot2.png", width = 480, height = 480)

        # read only the relevant rows of the data
        df3 <- read.table((pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')),colClasses = "character", sep = ";")

        # insert the right names of the columns
        colnames(df3) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

        # some helpful formatting 
        df4 <- as.Date(df3$Date, format = "%d/%m/%Y")
        df3$Date <- df4
        df3$datetime <- as.POSIXct(paste(df3$Date, df3$Time), format="%Y-%m-%d %H:%M:%S")
        Sys.setlocale("LC_TIME", "en_US")
        df4 <- as.numeric(df3$Global_active_power)
        df3$Global_active_power <- df4

        # making Plot1
        plot(df3$datetime, df$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")

        # shut down the device
        dev.off()
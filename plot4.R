        setwd("~/Desktop/Coursera/Exploratory Data Analysis/Week 1/Course Project")

        # create a png file
        png("plot4.png", width = 480, height = 480)

        # read only the relevant rows of the data
        df3 <- read.table((pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')),colClasses = "character", sep = ";")

        # insert the right names of the columns
        colnames(df3) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

        # some helpful formatting 
        df4 <- as.Date(df3$Date, format = "%d/%m/%Y")
        df3$Date <- df4
        df3$datetime <- as.POSIXct(paste(df3$Date, df3$Time), format="%Y-%m-%d %H:%M:%S")
        Sys.setlocale("LC_TIME", "en_US")
        df4 <- as.numeric(df3$Global_active_power, df5$Sub_metering_1, df5$Sub_metering_2, df5$Sub_metering_3, df5$Voltage, df5$Global_reactive_power)
        df3$Global_active_power <- df4

        par(mfrow = c(2,2))
        
        # making Plot1
        plot(df3$datetime, df$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")
        # making Plot 2
        plot(df3$datetime, df$Voltage, type="l", ylab="Voltage", xlab = "datetime")
        # making Plot 3
        plot(df3$datetime, df$Sub_metering_1, type="n", ylab="Energy sub metering", xlab = "")
        lines(df3$datetime, df$Sub_metering_1)
        lines(df3$datetime, df$Sub_metering_2, col = "red")
        lines(df3$datetime, df$Sub_metering_3, col = "blue")
        legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"))
        # making Plot 4
        plot(df3$datetime, df$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab = "datetime")

        # shut down the device
        dev.off()
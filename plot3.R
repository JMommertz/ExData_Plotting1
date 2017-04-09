        setwd("~/Desktop/Coursera/Exploratory Data Analysis/Week 1/Course Project")

        # create a png file
        png("plot3.png", width = 480, height = 480)

        # read only the relevant rows of the data
        df5 <- read.table((pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')),colClasses = "character", sep = ";")

        # insert the right names of the columns
        colnames(df5) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

        # some helpful formatting 
        df6 <- as.Date(df5$Date, format = "%d/%m/%Y")
        df5$Date <- df6
        df5$datetime <- as.POSIXct(paste(df5$Date, df5$Time), format="%Y-%m-%d %H:%M:%S")
        Sys.setlocale("LC_TIME", "en_US")
        df6 <- as.numeric(df5$Sub_metering_1, df5$Sub_metering_2, df5$Sub_metering_3)
        df5$Global_active_power <- df6

        # making Plot3.1
        plot(df5$datetime, df$Sub_metering_1, type="n", ylab="Energy sub metering", xlab = "")
        # add lines
        lines(df5$datetime, df$Sub_metering_1)
        lines(df5$datetime, df$Sub_metering_2, col = "red")
        lines(df5$datetime, df$Sub_metering_3, col = "blue")
        
        # add legend
        legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"))
        # shut down the device
        dev.off()
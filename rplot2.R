
rplot2 <- function() {
        my_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
        my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
        
        data <- subset(my_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
        rm(my_data)
        
        datetime <- paste(as.Date(data$Date), data$Time)
        data$Datetime <- as.POSIXct(datetime)
       
        png("Plot2.png", height=480,width=480)
        plot(data$Global_active_power~data$Datetime, type="l",
            ylab="Global Active Power (kilowatts)", xlab="")
        
        dev.off()
        
}
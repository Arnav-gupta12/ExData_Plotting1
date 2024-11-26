
rplot3 <- function() {
        my_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                            check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
        my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
        
        data <- subset(my_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
        rm(my_data)
        
        datetime <- paste(as.Date(data$Date), data$Time)
        data$Datetime <- as.POSIXct(datetime)
        
        png("Plot3.png", height=480,width=480)
        plot(data$Sub_metering_1~data$Datetime, type="l", ylab="Energy sub metering",xlab="")
        
        lines(data$Sub_metering_2~data$Datetime,col="red")
        lines(data$Sub_metering_3~data$Datetime,col="blue")
        legend("topright", col=c("black","red","blue"),legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1))
        dev.off()
        
}
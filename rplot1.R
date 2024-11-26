rplot <- function() {
        
        hpc_table <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
        
        hpc_table$Date <- strptime(hpc_table$Date, "%d/%m/%Y")
        
        
        hpc_subset <- hpc_table[hpc_table$Date == "2007-02-01" | hpc_table$Date == "2007-02-02",]
        
        rm(hpc_table)
        
        png("Plot1.png",height=480,width=480)
        
        
        hist(as.numeric(hpc_subset$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
        
        
        dev.off()
        
                                                           
}
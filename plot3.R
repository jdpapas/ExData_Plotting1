        hpc_data <- read.csv("data\\household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = F)
        hpc_data$Date <- as.Date(hpc_data$Date, "%d/%m/%Y")
        hpc_data <- hpc_data[hpc_data$Date == "2007-02-01" | hpc_data$Date == "2007-02-02",]
        hpc_data$DateTime <- paste(hpc_data$Date, hpc_data$Time)
        hpc_data$DateTime <- strptime(hpc_data$DateTime, format = "%Y-%m-%d %H:%M:%S")
        hpc_data$Global_active_power <- as.numeric(hpc_data$Global_active_power)
        png(file="plot3.png")
        plot(hpc_data$DateTime, hpc_data$Sub_metering_1, ylab = "Energy sub metering", xlab="", type="n")
        lines(hpc_data$DateTime, hpc_data$Sub_metering_1, type="l")
        lines(hpc_data$DateTime, hpc_data$Sub_metering_2, type="l", col="red")
        lines(hpc_data$DateTime, hpc_data$Sub_metering_3, type="l", col="blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
        dev.off()
        

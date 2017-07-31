# load data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="./rawData.zip")
df <- read.table(unz("rawData.zip", "household_power_consumption.txt"),
                 header = T, sep=";", na.strings = "?")

# arrange data
df2 <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df2$DateTime <- strptime(paste0(df2$Date,df2$Time),"%d/%m/%Y %H:%M:%S")

# create graph
plot(df2$DateTime,df2$Sub_metering_1, type="n",xlab = "",ylab="Energy sub metering")
lines(df2$DateTime,df2$Sub_metering_1, col="black")
lines(df2$DateTime,df2$Sub_metering_2, col="red")
lines(df2$DateTime,df2$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# save graph
dev.copy(device = png, filename = 'plot3.png', width = 500, height = 500)
dev.off()

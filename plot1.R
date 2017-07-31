# load data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="./rawData.zip")
df <- read.table(unz("rawData.zip", "household_power_consumption.txt"),
                 header = T, sep=";", na.strings = "?")

# arrange data
df2 <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df2$DateTime <- strptime(paste0(df2$Date,df2$Time),"%d/%m/%Y %H:%M:%S")

# create graph
hist(df2$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# save graph
dev.copy(device = png, filename = 'plot1.png', width = 480, height = 480)
dev.off()
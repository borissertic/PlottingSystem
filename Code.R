#Import the data

df <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

#Converting date variables

df$Date <- as.Date(df$Date, "%d/%m/%Y")

#Subseting the data

df_sub <- subset(df, df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"))

#Plot1

df_sub$Global_active_power <- as.character(df_sub$Global_active_power)
df_sub$Global_active_power <- as.numeric(df_sub$Global_active_power)

hist(df_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylim = c(0, 1200))
dev.copy(png, file = "plot1.png") #Copy histogram to png file
dev.off()

#Plot2

#Merging date and time
df_sub$Datetime <- as.POSIXct(paste(df_sub$Date, df_sub$Time), format="%Y-%m-%d %H:%M:%S")

#Create plot
plot(df_sub$Datetime, df_sub$Global_active_power, type = "l",
    ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, "plot2.png") #Copy to file
dev.off()

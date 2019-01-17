#Import the data
df <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

#Converting date variables
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#Subseting the data
df_sub <- subset(df, df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"))

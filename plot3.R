library(sqldf)

file_path <- "household_power_consumption.txt"
data <- read.csv.sql(
  file_path,
  sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'",
  sep = ";",
  header = TRUE
)

# Convert Date and Time to DateTime
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")


# Open the PNG device
png("plot3.png", width = 480, height = 480)

# Create the plot
plot(data$DateTime, data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy Sub Metering", col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

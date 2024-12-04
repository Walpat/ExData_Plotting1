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


# plot2.R
png("plot2.png", width = 480, height = 480)

plot(data$DateTime, data$Voltage, type = "l", 
     xlab = "DateTime", ylab = "Voltage (volts)")
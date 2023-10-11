#flights = jsonlite::fromJSON("data/international_flights.json")

data1 = list(
  file = "data/international_flights.json",
  meta = list(
    name = "國際航空定期時刻表",
    source_link = "https://data.gov.tw/dataset/161167")
)

flights = list(
  data = list(data1)
)

flights$data[[1]]$file

saveRDS(flights, file = "data/flights.rds")

flightsData <- jsonlite::fromJSON("data/international_flights.json")

flights$data[[1]]$data_frame <- flightsData
flights$data[[1]]$data_frame

saveRDS(flights, file = "data/flights.rds")


flightsData[3, "ScheduleStartDate"]
flightsData[3, 2 : 5]
flightsData[c(2, 4), c(1, 3, 4)]
flightsData[c(2, 4), c(1, 2, 2, 2)]


names = c("John", "Mary", "Tom")
ages = c(30, 25, 35)
isMarried = c(TRUE, FALSE, TRUE)

data_fbf <- data.frame(
  name = names, 
  age = ages, 
  married = isMarried
)
data_fbf[1, c(1, 3)]
data_fbf[1]
data_fbf[1, ]

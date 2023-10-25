flights = readRDS("data/flights.rds")
str(flights)

flightsData <- flights$data[[1]]$data_frame

dplyr::glimpse(flights$data[[1]]$data_frame)



levels(flightsData$AirlineID)

levels(flightsData$AirlineID) |> length()
length(levels(flightsData$AirlineID))

table(flightsData$AirlineID) |> sum()
table(flightsData$AirlineID) |> sort(decreasing = TRUE) |> head(10)
head(sort(table(flightsData$AirlineID), FALSE), 10)

saveRDS(flights, file="flights.rds")

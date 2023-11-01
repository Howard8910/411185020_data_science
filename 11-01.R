#week 7 ------

flights = readRDS("data/flights.rds")
flightsData <- flights$data[[1]][["data_frame"]]

data2 <- list(
  meta = list(
    name="航空公司統一代碼",
    source_link ="https://data.gov.tw/dataset/8088"
  ),
  file = "data/airlines.json"
)

flights$data[[2]] <- data2

airlines <-
  jsonlite::fromJSON(
    flights$data[[2]][["file"]]
  )

flights$data[[2]][["data_frame"]] <- airlines

saveRDS(flights, file="flights.rds")

dplyr::glimpse(airlines)


dplyr::left_join(
  flightsData, airlines,
  by="AirlineID"
) -> flightsData



install.packages("airportr")
airports <- airportr::airports
dplyr::glimpse(airports)

pick_taiwan <- airports$Country == "Taiwan"
airports$IATA[pick_taiwan] |> View()

dplyr::filter(
  airports,
  Country == "Taiwan"
) -> airports_taiwan



airports_taiwan$IATA
unique(airports_taiwan$IATA)

pick_departure <- flightsData$DepartureAirportID %in% airports_taiwan$IATA
flightsData[pick_departure, ]
flightsData |> dplyr::filter(pick_departure) -> departure_flightsData

pick_arrival <- flightsData$ArrivalAirportID %in% airports_taiwan$IATA
flightsData[pick_arrival, ]
flightsData |> dplyr::filter(pick_arrival) -> arrival_flightsData

flights$data[[3]] <- list(
  departure_flightsData= departure_flightsData,
  arrival_flightsData = arrival_flightsData
)

nrow(departure_flightsData)
nrow(arrival_flightsData)

saveRDS(flights, file="data/flights.rds")

#week 8 ------

flightsData <- readRDS("data/flightsData_week8.rds")
dplyr::glimpse(flightsData)

lubridate::ymd(flightsData$ScheduleStartDate) -> flightsData$ScheduleStartDate
lubridate::ymd(flightsData$ScheduleEndDate) -> flightsData$ScheduleEndDate
dplyr::glimpse(flightsData)

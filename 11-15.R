flights <- readRDS("data/flights_week10.rds")
flightsData <- flights$data[[1]]$data_frame
dplyr::glimpse(flightsData)

unique_time_zone <- unique(flightsData$DepartureTimeZone)
num_time_zone <- length(unique_time_zone)

flightsData$DepartureTimeZone |> table() |> sort(decreasing = T) -> table_DepartureTimeZone
flights$dataSummary$DepartureTimeZone <- table_DepartureTimeZone

saveRDS(flights, file = "flights_week10_after.rds")



flightsData |> split(flightsData$DepartureTimeZone) -> split_flightsData

x=1
split_flightsData[[x]]$DepartureTime <- 
  lubridate::ymd_hm(split_flightsData[[x]]$DepartureTime, tz = split_flightsData[[x]]$DepartureTimeZone[[1]]) 
class(split_flightsData[[1]])

flightsData |>
  dplyr::group_by(DepartureTimeZone) |> 
  dplyr::mutate(
    DepartureTime = lubridate::ymd_hm(DepartureTime, tz = DepartureTimeZone[[1]]) 
  ) |>
  dplyr::ungroup() ->
  flightsData


i = 1
for (i in 1:length(split_flightsData)) {
  split_flightsData[[i]]$DepartureTime <- 
    lubridate::ymd_hm(split_flightsData[[i]]$DepartureTime, tz = split_flightsData[[i]]$DepartureTimeZone[[1]]) 
}

flights$data[[1]]$data_frame <- flightsData

saveRDS(flights, file = "flights_week11.rds")

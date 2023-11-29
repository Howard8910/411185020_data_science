nums <- c(1, 2, 3, 4, 5)

for (i in nums){
  print(i)
}


dataSet <- list(
  list(
    gender="male", height=178, age=32,
    children=list(
      list(gender="male", age=5),
      list(gender="male", age=0))
  ),
  list(
    gender="female", height=166, age=30,
    children=list(
      list(gender="female", age=3))
  ),
  list(
    gender="male", height=170, age=42,
    children=list(
      list(gender="male", age=10),
      list(gender="female", age=8))
  ),
  list(
    gender="male", height=188, age=22,
    children=list()
  ),  
  list(
    gender="male", height=172, age=52,
    children=list(
      list(gender="female", age=25),
      list(gender="female", age=23))
  ),
  list(
    gender="female", height=160, age=42,
    children=list(
      list(gender="female", age=11))
  )
)

for (i in seq_along(dataSet)) {
  print(length(dataSet[[i]]$children))
}



flights <- readRDS("data/flights_week10.rds")
flightsData <- flights$data[[1]]$data_frame
flightsData |> split(flightsData$AirlineID) -> split_data

datalink = "https://apiservice.mol.gov.tw/OdService/download/A17000000J-030504-c2b"
data <- readr::read_csv2(datalink)
datalink2 = "https://quality.data.gov.tw//dq_download_csv.php?nid=26230&md5_url=b63a53413efde2c17791d2b482babb81"
data2 <- readr::read_csv2(datalink2)
datalink3 = "http://www.lia-roc.org.tw/rss/%E5%A3%BD%E9%9A%AA%E6%A5%AD%E8%A2%AB%E4%BF%9D%E9%9A%AA%E4%BA%BA%E6%AD%BB%E4%BA%A1%E5%8E%9F%E5%9B%A0%E5%88%86%E6%9E%90.csv"
data3 <- readr::read_csv2(datalink3)
datalink4 = "https://quality.data.gov.tw//dq_download_csv.php?nid=18420&md5_url=44314524414150faa7ccb2800813f493"
data4 <- readr::read_csv2(datalink4)
data4 <- jsonlite::fromJSON("https://quality.data.gov.tw//dq_download_json.php?nid=18420&md5_url=44314524414150faa7ccb2800813f493")
data5 <- readr::read_csv2("https://quality.data.gov.tw//dq_download_csv.php?nid=18420&md5_url=44314524414150faa7ccb2800813f493")
data6 <- readr::read_csv2("data/t21sc03_111_6.csv")
data7 <- readr::read_csv2("data/t21sc03_112_4.csv")

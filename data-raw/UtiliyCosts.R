library(tibble)
library(readr)

df <- frame_data(
  ~date, ~infrastructure, ~price, ~usage, ~unit,
  "2016-05-19", "light", 554, 11, "kWh",
  "2016-06-02", "gas", 2305, 0.7, "m3",
  "2016-06-17", "light", 1751, 51, "kWh"
)

df %>% write_csv("data-raw/UtilityCosts.csv")

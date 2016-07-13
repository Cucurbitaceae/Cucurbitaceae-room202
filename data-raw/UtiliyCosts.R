library(tibble)
library(readr)
library(git2r)

# Config ------------------------------------------------------------------
config <- config::get()
config::is_active("default")

# Data Collection ---------------------------------------------------------
df <- frame_data(
  ~date, ~infrastructure, ~price, ~usage, ~unit,
  "2016-05-19", "light", 554, 11, "kWh",
  "2016-06-02", "gas", 2305, 0.7, "m3",
  "2016-06-17", "light", 1751, 51, "kWh",
  "2016-06-27", "internet", 6437, NA, NA,
  "2016-07-04", "water", 2975, 5, "m3",
  "2016-07-04", "gas", 2365, 0.8, "m3"
)

df %>% write_csv("data-raw/UtilityCosts.csv")

# Push to GitHub ----------------------------------------------------------
r <- repository("~/git/room207")
add(r,
    c("data-raw/UtiliyCosts.R", "data-raw/UtilityCosts.csv"))
commit(r, "update")
push(r, "origin", 
     "refs/heads/master", 
     credentials = cred_user_pass("EMAIL", config$ghpat))

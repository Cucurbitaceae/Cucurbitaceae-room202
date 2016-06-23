# Load Employed Packages --------------------------------------------------
library(readr)
library(lubridate)
library(dplyr)
library(git2r)

# Config ------------------------------------------------------------------
config <- config::get()
config::is_active("default")

# Data Collection ---------------------------------------------------------
df <- read_csv("~/myroom.csv")
df %<>% dplyr::filter(DateTime %within% interval(ymd("2016-05-06"), today() - 1))

df %>% write_csv("data-raw/Environment.csv")

# Push to GitHub ----------------------------------------------------------
r <- repository("/home/hadley/git/room207")
add(r,
    c("data-raw/Environment.R", "data-raw/Environment.csv"))
commit(r, "add utility cost data")
push(r, "room207", 
     "refs/heads/master", 
     credentials = cred_user_pass("EMAIL", config$ghpat))



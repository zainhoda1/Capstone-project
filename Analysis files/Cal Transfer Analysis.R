library(dplyr)
library(here)

data <- read.csv("Documents/GitHub/Capstone-project/Data folder/final_dataset.csv", header=TRUE)
data2 <- data

data_f <- data %>%
  arrange(Player.Name, year) %>%
  group_by(Player.Name) %>%
  filter(row_number() <= n()-1)

data2_f <- data2 %>%
  arrange(Player.Name, year) %>%
  group_by(Player.Name) %>%
  filter(row_number() > 1)

df1 <- cbind(data_f, data2_f)
df2 <- df1 %>%
  filter("Player.Name...2", "season...3", "season...135")

temp <- data %>%
  filter(Player.Name == "markus-howard-1" | Player.Name == "ochai-agbaji-1")

temp2 <- data %>%
  filter(Player.Name == "markus-howard-1" | Player.Name == "ochai-agbaji-1")
  
temp_f <- temp %>%
  arrange(Player.Name, year) %>%
  group_by(Player.Name) %>%
  filter(row_number() <= n()-1)

temp2_f <- temp2 %>%
  arrange(Player.Name, year) %>%
  group_by(Player.Name) %>%
  filter(row_number() > 1)
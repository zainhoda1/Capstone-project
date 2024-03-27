library(dplyr)
library(here)

data <- read.csv("Documents/GitHub/Capstone-project/Data folder/final_dataset.csv", header=TRUE)
data2 <- data

data_f <- data %>%
  arrange(Player.Name, year) %>%
  group_by(Player.Name) %>%
  filter(row_number() <= n()-1)

cols <- colnames(data_f)

data2_f <- data2 %>%
  arrange(Player.Name, year) %>%
  group_by(Player.Name) %>%
  filter(row_number() > 1)

cols2 <- colnames(data2_f)
cols2 <- paste0(cols2, "_n1")
colnames(data2_f) <- cols2

df1 <- cbind(data_f, data2_f)

colnames(df1) <- c("Unnamed_n1", "Player_Name", "season_n1", "Team_n1", "conf_abbr_n1",
  "games_n1", "games_started_n1", "games_started_n1", "mp_per_g_n1", "fg_per_g_n1", 
  "fga_per_g_n1", "fg_pct_n1", 
df2 <- df1 %>%
  filter(Player.Name...2, season...3, season...162)



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
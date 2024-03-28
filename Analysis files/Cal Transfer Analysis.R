library(dplyr)
library(here)
library(utils)

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

df1 <- df1 %>%
  mutate(player_type= ifelse(Team==Team_n1, 1, 0))

df1 <- df1 %>%
  select(player_type, Team, Team_n1, everything())

df_transfer <- df1 %>%
  filter(player_type==0)
write.csv(df_transfer, "Documents/GitHub/Capstone-project/Data folder/transfer.csv")

#write.csv(df1,file=here::here("data","hereTest.csv")
df_nontransfer_returner <- df1 %>%
  filter(player_type==1)
write.csv(df_nontransfer_returner, "Documents/GitHub/Capstone-project/Data folder/nontransferreturner.csv")


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
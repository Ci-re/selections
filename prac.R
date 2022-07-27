library(tidyverse)
library(readxl)


dat <- read_excel("tables/21.GS.C4.AYT.45.IB_Selections.xls", sheet = "Advancement")
View(dat)

acc <- dat %>% select(Genotype)
acc <- as.list(acc)

getwd()

acc

gen <- dat$Genotype
length(gen)


datageh <- read_excel("../../../Music/week1_data.xls")
datageh

datageh <- datageh %>% mutate(fork2 = if_else(forked == "Yes","y","n"))
View(datageh)
WriteXLS::WriteXLS(datageh)

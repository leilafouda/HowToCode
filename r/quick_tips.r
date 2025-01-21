# Need a BOOST!?!
library(praise)
praise()
#Also:
## Capitalization
praise("${Exclamation}! This ${rpackage} is ${adjective}!")
## All upper case
praise("${EXCLAMATION}! You have done this ${adverb_manner}!")

#To put on multiple lines a long file name--------
#rather than:

test <- read.csv("This is a really long file name that will not fit within one line because it is intentionally really long.csv")

#use this:

test_paste <- read.csv(paste0("This is a really lone file name that will not fit ",
                        "within one line because it is intentionally really ",
                        "long.csv"))

#To filter out multiple items in a column--------
filter(COLUMN %in%  c('ID1','ID2','ID3'))

#e.g.
dataframe_02 <- dataframe_01 %>%
  filter(Column_01 %in% c('Name_02', 
                          'Name_06', 'Name_08'))

#Want to prevent scientfic notation i.e.--------
#Show 100000 rather than 1e5:
options("scipen" = 10) # sets it to 10 
options()$scipen # tells you what it is set to
# can also  just set to very large number so see all values e.g.
options(scipen=999)
#reset with
options(scipen=0)

#Rename a columns--------
# You can use dplyr::rename(NEW_NAME = Old_Name) this uses library(tidyverse)
# e.g.
df2 <- df %>% 
   dplyr::rename(NEW_NAME = Old_Name)

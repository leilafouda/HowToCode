#To put on multiple lines a long file name:
#rather than:

test <- read.csv("This is a really long file name that will not fit within one line because it is intentionally really long.csv")

#use this:

test_paste <- read.csv(paste0("This is a really lone file name that will not fit ",
                        "within one line because it is intentionally really ",
                        "long.csv"))

#To filter out multiple items in a column
filter(COLUMN %in%  c('ID1','ID2','ID3'))

#e.g.
dataframe_02 <- dataframe_01 %>%
  filter(Column_01 %in% c('Name_02', 
                          'Name_06', 'Name_08'))

#To put on multiple lines a long file name:
#rather than:

test <- read.csv("This is a really long file name that will not fit within one line because it is intentionally really long.csv")

#use this:

test_paste <- read.csv(paste0("This is a really lone file name that will not fit ",
                        "within one line because it is intentionally really ",
                        "long.csv"))

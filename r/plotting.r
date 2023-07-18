## Make y-axis end where want with dates etc: ##
#https://stackoverflow.com/questions/48185545/limits-argument-in-scale-x-date-ggplot-still-produces-dates-outside-data-frame 

expand=c(0,0)

#e.g.:

ggplot(data=df, aes(x=date, y=value)) +
  geom_line() + 
  scale_x_date(date_breaks = "day", expand = c(0,0)) +
  theme(axis.text.x=element_text(angle=90, vjust = 0.5))

#From the help page:
#expand: A numeric vector of length two giving multiplicative and additive expansion constants. 
#These constants ensure that the data is placed some distance away from the axes. 
#The defaults are c(0.05, 0) for continuous variables, and c(0, 0.6) for discrete variables.

######################################################################################################
#----------------------------------------------------------------------------------------------------#
######################################################################################################

## Transparent background ##
#ggplot
#https://www.nagraj.net/notes/transparent-background-with-ggplot2/

# set transparency: 
theme(panel.grid.major = element_blank(), 
      panel.grid.minor = element_blank(), 
      panel.background = element_rect(fill = "transparent",colour = NA), 
      plot.background = element_rect(fill = "transparent",colour = NA))

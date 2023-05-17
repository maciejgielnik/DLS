library(ggplot2)
library(RColorBrewer)

head(data_for_plots)

names(data_for_plots)[1] <- "x"
names(data_for_plots)[c(2)] <- "y1"
names(data_for_plots)[c(4)] <- "y2"
names(data_for_plots)[c(6)] <- "y3"
names(data_for_plots)[c(3)] <- "ye1"
names(data_for_plots)[c(5)] <- "ye2"
names(data_for_plots)[c(7)] <- "ye3"
dim(data_for_plots)


varname <- (gsub(" ", "", paste("plot", 1)))
assign(varname, ggplot(data  = data_for_plots)  + geom_line(aes (x = x, y = y1)) + 
  geom_line(aes (x = x, y = y2)) +  geom_line(aes (x = x, y = y3)) + scale_x_log10() + 
    geom_ribbon(aes(x = x, ymin = y1 - ye1, ymax = y1 +ye1), alpha = 0.25 ) + 
    geom_ribbon(aes(x = x, ymin = y2 - ye2, ymax = y2 +ye2), alpha = 0.25 ) + 
    geom_ribbon(aes(x = x, ymin = y3 - ye3, ymax = y3 +ye3), alpha = 0.25 ) + 
    xlab("Radius [nm]") + ylab("Frequency"))
xD1
?ggplot


ggplot(data  = data_for_plots)  + geom_line(aes (x = x, y = y1), colour = "blue") + 
  geom_line(aes (x = x, y = y2), colour = "blue") +  geom_line(aes (x = x, y = y3), colour = "blue") + scale_x_log10() + 
  geom_ribbon(aes(x = x, ymin = y1 - ye1, ymax = y1 +ye1), alpha = 0.25 ) + 
  geom_ribbon(aes(x = x, ymin = y2 - ye2, ymax = y2 +ye2), alpha = 0.25 ) + 
  geom_ribbon(aes(x = x, ymin = y3 - ye3, ymax = y3 +ye3), alpha = 0.25 ) + 
  xlab("Radius [nm]") + ylab("Frequency") + ylim(-5, 20)



ggplot(data  = data_for_plots)  + geom_line(aes (x = x, y = y1), size = 2) + 
   scale_x_log10() +  geom_ribbon(aes(x = x, ymin = y1 - ye1, ymax = y1 +ye1), alpha = 0.25 ) + 
  xlab("Radius [nm]") + ylab("Frequency") + ylim(-5, 20) 





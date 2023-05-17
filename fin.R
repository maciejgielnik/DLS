library(ggplot2)
library(readxl)
library(cowplot)

i <- 1
setwd(dir_in_dls_set)
dir()
setwd(directories[7])
dir()

while(i < 8){


setwd(cycle_matrix[i,1])

data_for_plots <- data.frame()

read_file <- read_xlsx("1.xlsx")
data_for_plots <- as.data.frame(read_file)
read_file <- as.data.frame(read_xlsx("2.xlsx"))
data_for_plots<- cbind(data_for_plots, read_file[, 2:3])
read_file <- as.data.frame(read_xlsx("3.xlsx"))
data_for_plots<- cbind(data_for_plots, read_file[, 2:3])




head(data_for_plots)

names(data_for_plots)[1] <- "x"
names(data_for_plots)[c(2)] <- "y1"
names(data_for_plots)[c(4)] <- "y2"
names(data_for_plots)[c(6)] <- "y3"
names(data_for_plots)[c(3)] <- "ye1"
names(data_for_plots)[c(5)] <- "ye2"
names(data_for_plots)[c(7)] <- "ye3"
head(data_for_plots)

varname <- (gsub(" ", "", paste(directories[7], i)))
assign(varname, ggplot(data  = data_for_plots)  + geom_line(aes (x = x, y = y1)) + 
         geom_line(aes (x = x, y = y2)) +  geom_line(aes (x = x, y = y3)) + scale_x_log10() + 
         geom_ribbon(aes(x = x, ymin = y1 - ye1, ymax = y1 +ye1), alpha = 0.25 ) + 
         geom_ribbon(aes(x = x, ymin = y2 - ye2, ymax = y2 +ye2), alpha = 0.25 ) + 
         geom_ribbon(aes(x = x, ymin = y3 - ye3, ymax = y3 +ye3), alpha = 0.25 ) + 
         xlab("Radius [nm]") + ylab("Frequency") + ylim(-5, 15))
setwd(dir_in_dls_set)
setwd(directories[7])
print(i)
i <- i +1
}

#cont
plot_grid(control1, control2, control3, control4, control5, control6, control7,
          EDR_011, EDR_012, EDR_013, EDR_014, EDR_015, EDR_016, EDR_017,
          EDR_021, EDR_022, EDR_023, EDR_024, EDR_025, EDR_026, EDR_027, 
          EDR_051, EDR_052, EDR_053, EDR_054, EDR_055, EDR_056, EDR_057, 
          nrow = 4, ncol = 7)

?plot_grid


plot_grid(control1, control2, control3, control4, control5, control6, control7, nrow = 1, ncol = 7)
plot_grid(EDR_011, EDR_012, EDR_013, EDR_014, EDR_015, EDR_016, EDR_017,nrow = 1, ncol = 7)
plot_grid(EDR_021, EDR_022, EDR_023, EDR_024, EDR_025, EDR_026, EDR_027,nrow = 1, ncol = 7)
plot_grid(EDR_051, EDR_052, EDR_053, EDR_054, EDR_055, EDR_056, EDR_057,nrow = 1, ncol = 7)


plot_grid(control1, control2, control3, control4, control5, control6, control7,
          LEA_011, LEA_012, LEA_013, LEA_014, LEA_015, LEA_016, LEA_017,
          LEA_021, LEA_022, LEA_023, LEA_024, LEA_025, LEA_026, LEA_027, 
          LEA_051, LEA_052, LEA_053, LEA_054, LEA_055, LEA_056, LEA_057, 
          nrow = 4, ncol = 7)

plot_grid(LEA_011, LEA_012, LEA_013, LEA_014, LEA_015, LEA_016, LEA_017,nrow = 1, ncol = 7)
plot_grid(LEA_021, LEA_022, LEA_023, LEA_024, LEA_025, LEA_026, LEA_027,nrow = 1, ncol = 7)
plot_grid(LEA_051, LEA_052, LEA_053, LEA_054, LEA_055, LEA_056, LEA_057,nrow = 1, ncol = 7)




print(LEA_011)


print( LEA_011 +  geom_line(aes (x = x, y = y3), colour = "blue") )

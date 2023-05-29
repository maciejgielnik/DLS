library(ggplot2)
library(readxl)
library(cowplot)

i <- 1
intensity <- data.frame()
setwd(dir_in_dls_set)
## the directories variable contains numbers that correspond series of data
## pick [1] for "control" 
## [2] for "EDR_01"
## [3] for "EDR_02" 
## [4] for "EDR_05"
## [5] for "LEA_01"
## [6] for "LEA_02"
## [7] for "LEA_05" 
## [8] for "x_apoEDR_01" 
## [9] for "x_apoEDR_02" 
## [10] for "x_apoEDR_05" 
## [11] for "x_apoLEA_01" 
## [12] for "x_apoLEA_02"
## [13] for "x_apoLEA_05"
  setwd(directories[1])
  
  while(i < 8){
    
    setwd(cycle_matrix[i,1])
    
    data_for_plots <- data.frame()
    
    read_file <- read_xlsx("1.xlsx")
    data_for_plots <- as.data.frame(read_file)
    read_file <- as.data.frame(read_xlsx("2.xlsx"))
    data_for_plots<- cbind(data_for_plots, read_file[, 2:3])
    read_file <- as.data.frame(read_xlsx("3.xlsx"))
    data_for_plots<- cbind(data_for_plots, read_file[, 2:3])
    k <- 1
    while( k < 7) {
      
      intensity[i, k] <- sum(data_for_plots[10:28, k+1])
      
      
      k <- k+1
    }
    
    names(data_for_plots)[1] <- "x"
    names(data_for_plots)[c(2)] <- "y1"
    names(data_for_plots)[c(4)] <- "y2"
    names(data_for_plots)[c(6)] <- "y3"
    names(data_for_plots)[c(3)] <- "ye1"
    names(data_for_plots)[c(5)] <- "ye2"
    names(data_for_plots)[c(7)] <- "ye3"
    
    setwd(dir_in_dls_set)
    setwd(directories[1])
    print(i)
    i <- i +1
  }
  
  intensity
  names(intensity)[c(1)] <- "y1"
  names(intensity)[c(3)] <- "y2"
  names(intensity)[c(5)] <- "y3"
  names(intensity)[c(2)] <- "ye1"
  names(intensity)[c(4)] <- "ye2"
  names(intensity)[c(6)] <- "ye3"
  intensity <- cbind(intensity, c(0:6))
  names(intensity)[c(7)] <- "x"


## this is file with all the data form plots
##  y1, y2, y3 corresponds to summed intensities
## ye1, ye2, ye3 are SD for 1, 2 and 3 measurement
## x is a freeze-thaw cycle
intensity

## this makes a graph for y1 in function of x
aksheya_plot <- ggplot(data = intensity) + geom_point(aes(x = x, y = y1))
## to add points from second measurement you simply add points like this 
aksheya_plot <- aksheya_plot + geom_point(aes(x = x, y = y2))
## now we print this plot
print(aksheya_plot)
## time to add third measurement
aksheya_plot <- aksheya_plot + geom_point(aes(x = x, y = y3))
## now we print this plot
print(aksheya_plot)
## now you can keep this plot as a variable, but change the name like
aksheya_control <- aksheya_plot

## now you can play with colours and add error bars

## now run the same script just change the number in directories to 2, then 3 ...
## and save each plot in a different variable to not over-wright them 
## aksheya_edr01
## aksheya_edr02 etc



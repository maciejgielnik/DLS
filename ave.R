library(ggplot2)
library(readxl)
library(cowplot)

{
i <- 1
intensity <- data.frame()

setwd(dir_in_dls_set)
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
}



intensity



xdD <- intensity
print(intensity)
plot(intensity[,1])
plot(intensity[,3])
plot(intensity[,5])

xxx <- as.matrix( xdD[1, c(1, 3, 5)] )
xxx
class(xxx)
mean(xxx[1 ,])

xxx2 <- as.matrix(xdD)
xxx2

mean(xxx2[1 ,c(1, 3, 5)])

int_ave <- data.frame()
kk <- 1

while (kk < 8) {
  int_ave[kk, 1]<- (kk -1) 
  int_ave[kk, 2]<- mean(xxx2[kk ,c(1, 3, 5)])
  int_ave[kk, 3]<- mean(xxx2[kk ,c(2, 4, 6)])
kk <- kk +1  
}

str(int_ave)
int_ave

ggplot(data  = int_ave)  + geom_line(aes (x = V1, y = V2), size = 2) + 
  geom_ribbon(aes(x = V1, ymin = V2 - V3, ymax = V2 + V3), alpha = 0.25 )


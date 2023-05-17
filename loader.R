library(readxl)

setwd(dir_in_control)
setwd(cycle_matrix[1,1])

dir()

data_for_plots <- data.frame()

read_file <- read_xlsx("1.xlsx")
data_for_plots <- as.data.frame(read_file)
read_file <- as.data.frame(read_xlsx("2.xlsx"))
data_for_plots<- cbind(data_for_plots, read_file[, 2:3])
read_file <- as.data.frame(read_xlsx("3.xlsx"))
data_for_plots<- cbind(data_for_plots, read_file[, 2:3])




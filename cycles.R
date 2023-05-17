dir()
work_dir <- getwd()

cycle_name <- "cycle"
cycle_number <- as.character("1")

##matrix with names cycles
## number of cycles
k <- 0
n <- 7
cycle_matrix <- data.frame()
{
  for( i in 1:n )
    {
    cycle_number <- as.character(k)
    p1 <- paste(cycle_name, cycle_number, collapse = "")
    p1 <- gsub(" ", "", p1)
    cycle_matrix[i, 1] <- p1
    k <- k+1
  }
}

cycle_matrix[1,1]


